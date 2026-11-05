#!/usr/bin/env bash
# Build the release archives into ./Dist:
#   sugar-candy-<version>.tar.gz              the default theme
#   sugar-candy-<preset>-<version>.tar.gz     one theme per file in Presets/
# A preset archive is a complete theme whose theme.conf carries the preset
# values, so it can be installed from the SDDM settings and picked by its preview.
set -euo pipefail

out=Dist
version=$(sed -n 's/^Version=//p' metadata.desktop)

rm -rf "$out"
mkdir -p "$out"

stage() {
    mkdir -p "$1"
    cp -r Assets Backgrounds Components Previews \
        Main.qml theme.conf metadata.desktop \
        AUTHORS CHANGELOG.md COPYING CREDITS README.md "$1/"
}

pack() {
    tar -czf "$out/$1-$version.tar.gz" -C "$out" "$1"
    rm -r "${out:?}/$1"
}

stage "$out/sugar-candy"
pack sugar-candy

for preset in Presets/*.conf; do
    name=$(basename "$preset" .conf)
    title=$(printf '%s\n' "$name" | sed 's/\([a-z]\)\([A-Z]\)/\1 \2/g')
    id=sugar-candy-$(printf '%s\n' "$title" | tr 'A-Z ' 'a-z-')
    dir=$out/$id

    if [ ! -f "Previews/$name.png" ]; then
        echo "Missing Previews/$name.png for preset $name" >&2
        exit 1
    fi

    stage "$dir"

    # Replace each preset key in theme.conf; fail on a key theme.conf does not have.
    awk '
        NR == FNR { if (/^[A-Za-z]+=/) { v[substr($0, 1, index($0, "=") - 1)] = substr($0, index($0, "=") + 1) } next }
        /^[A-Za-z]+=/ {
            k = substr($0, 1, index($0, "=") - 1)
            if (k in v) { print k "=" v[k]; used[k] = 1; next }
        }
        { print }
        END {
            for (k in v) if (!(k in used)) { print "Unknown key " k > "/dev/stderr"; bad = 1 }
            exit bad
        }
    ' "$preset" "$dir/theme.conf" > "$dir/theme.conf.new"
    mv "$dir/theme.conf.new" "$dir/theme.conf"

    sed -i \
        -e "s|^Name=.*|Name=Sugar Candy - $title|" \
        -e "s|^Theme-Id=.*|Theme-Id=$id|" \
        -e "s|^Screenshot=.*|Screenshot=Previews/$name.png|" \
        "$dir/metadata.desktop"
    find "$dir/Previews" -type f ! -name "$name.png" -delete

    pack "$id"
done

ls -l "$out"
