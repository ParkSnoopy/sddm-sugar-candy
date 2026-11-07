//
// This file is part of SDDM Sugar Candy.
// A theme for the Simple Display Desktop Manager.
//
// Copyright (C) 2026 ParkSnoopy
//
// SDDM Sugar Candy is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the
// Free Software Foundation, either version 3 of the License, or any later version.
//
// You are required to preserve this and any additional legal notices, either
// contained in this file or in other files that you received along with
// SDDM Sugar Candy that refer to the author(s) in accordance with
// sections §4, §5 and specifically §7b of the GNU General Public License.
//
// SDDM Sugar Candy is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with SDDM Sugar Candy. If not, see <https://www.gnu.org/licenses/>
//

// On Wayland SDDM does not load Qt Virtual Keyboard, the compositor draws the
// keyboard. This talks to KWin's keyboard through the Plasma module. Without
// Plasma the import fails, the Loader reports an error and the button stays hidden.

import QtQuick
import org.kde.plasma.workspace.keyboardlayout as Keyboards

QtObject {
    readonly property bool available: Keyboards.KWinVirtualKeyboard.available
    readonly property bool shown: Keyboards.KWinVirtualKeyboard.visible

    function toggle() {
        if (shown) {
            Keyboards.KWinVirtualKeyboard.active = false
        } else if (typeof Keyboards.KWinVirtualKeyboard.forceActivate === "function") {
            // Plasma 6.1 and later
            Keyboards.KWinVirtualKeyboard.forceActivate()
        } else {
            Keyboards.KWinVirtualKeyboard.active = true
        }
    }
}
