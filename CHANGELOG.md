# Changelog

## [HEAD]
### Fixed
- The virtual keyboard now types into the password field. Clicking the "Virtual Keyboard" button took the focus from the text field, so the keys went nowhere.
- The virtual keyboard now opens when no text field has focus. Before, the button moved the form up but no keyboard appeared. The button now focuses the username field if it is empty, else the password field.

### Removed
- Removed the `Arabic Left` and `Arabic Right` release archives. The Examples section now shows Partial Blur with `Locale="ko_KR.UTF-8"` instead, and its values are in `Examples/` (not released as a theme).

## [1.7] - 2026-11-06
### Changed
- **Breaking:** Renamed `Backgrounds/Undraw.svg` to `Backgrounds/Illustration.svg` and replaced it with an original illustration. Update `Background=` in your `theme.conf` if you used the old name.
- Replaced every asset of unclear license. The background photographs are now public domain or CC0 photographs, and the user icon, the four system button icons (suspend, hibernate, reboot, shutdown), the illustration and `Rocks.jpg` are original work. All sources are listed in `CREDITS`.
- Replaced all images in `Previews` with captures that use the new assets.

### Removed
- Removed `Backgrounds/Sunset.jpg` because its license is unknown. The Full Blur variant now uses `Desert.jpg`.

## [1.6] - 2026-11-05
### Added
- Each release now also contains one ready-made theme archive per preview image (for example `sugar-candy-screen-padding-left-1.6.tar.gz`). Install one from the SDDM settings and pick it by its preview. The presets are in `Presets/`.
- Every preview with the form on one side now has a left and a right version (`FormPosition="left"` and `FormPosition="right"`). Previews with a centered form have one version.
- Renamed the previews `PartialBlur`, `ScreenPadding`, `ScaleImageCropped` and `ForceRightToLeft` to `PartialBlurLeft`, `ScreenPaddingLeft`, `ScaleImageCroppedLeft` and `ArabicLeft`, and added the matching right versions.

### Changed
- **Breaking:** The theme now targets Qt6 and runs only in `sddm-greeter-qt6` (SDDM >= 0.21, Qt >= 6.5). `metadata.desktop` sets `QtVersion=6`.
- Replaced `QtGraphicalEffects` with `QtQuick.Effects` (`MultiEffect`) for the background blur and the popup shadows. The blur and shadow values are calibrated to match the old look.
- Switched all QML imports to the versionless Qt6 form.
- Switched `Connections` and `Keys` handlers to the Qt6 syntax.
- Updated the dependency list and distro package names in the README for Qt6.
- Replaced all images in `Previews` with captures from `sddm-greeter-qt6`.

### Fixed
- The user dropdown no longer shows a black backdrop behind its icon in Qt6.
- The user dropdown no longer draws the user name under its icon in Qt6.
- Keyboard navigation between the session dropdown and the system buttons works again in Qt6.

## [1.5] - 2020-01-30
### Fixed
- The username input now gets selected on focus

### Added
- Option to allow usernames with mixed case lettering. This is highly discouraged!
- Option to allow login without password. Makes the login button always enabled.

### Changed
- The user dropdown select now only shows the username not the real name.

## [1.4] - 2019-11-12
### Fixed
- Username now gets automatically converted to lowercase at login to prevent errors

## [1.3] - 2019-10-04
### Fixed
- The Login button can now be activated with Return/Enter keys

### Added
- Up/Down arrow keys now intuitively navigate through the whole interface
- Enter/Return keys can be used to login directly from within the username and password fields
## [1.2] - 2019-07-15
### Added
- Option to completely hide and disable power buttons

## [1.1] - 2019-07-09
### Added
- Full support for the Qt Virtual Keyboard

## Changed
- "Show Password" check box label now the same size as rest of secondary UI elements
