# Changelog

## [1.6] - 2026-11-05
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
