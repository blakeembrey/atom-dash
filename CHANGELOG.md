# Change Log

All notable changes to this project will be documented in this file. This project adheres to [Semantic Versioning](http://semver.org/).

## [1.3.0](https://github.com/blakeembrey/atom-dash/compare/v1.2.1...v1.3.0)

### Added

- Add support for Velocity (using Dash URIs) under Windows
- Add support for Zeal under Linux

## [1.2.1](https://github.com/blakeembrey/atom-dash/compare/v1.2.0...v1.2.1)

### Added

- Create and backtrack CHANGELOG.

### Fixed

- Fallback to the current word under cursor when range returns undefined.

### Changed

- Commands no longer imply usage of event object as a truthy value.
- Context menu shortcut follows the same logic as shortcuts now.

## [1.2.0](https://github.com/blakeembrey/atom-dash/compare/v1.1.1...v1.2.0) - 2015-06-10

### Added

- Allow Dash to look up filename specific docsets and merge with the language docsets.

## [1.1.1](https://github.com/blakeembrey/atom-dash/compare/v1.1.0...v1.1.1) - 2015-04-16

### Added

- Use `activationCommands` feature to initalize plugin on demand.

### Changed

- Remove Atom deprecated method calls.
- Use consistent CSS selector.

## [1.1.0](https://github.com/blakeembrey/atom-dash/compare/v1.0.3...v1.1.0) - 2015-03-16

### Changed

- Use `spawn` with `-g` instead of `shell.openExternal` to call Dash without opening it (see #14).

### Removed

- No more Gittip badge on README.

## [1.0.3](https://github.com/blakeembrey/atom-dash/compare/v1.0.2...v1.0.3) - 2015-03-16

### Fixed

- Avoid crashing when activated without an active editor.

### Removed

- Remove under-used dependencies.

## [1.0.2](https://github.com/blakeembrey/atom-dash/compare/v1.0.1...v1.0.2) - 2015-01-17

### Changed

- Updated Atom scope classes.

## [1.0.1](https://github.com/blakeembrey/atom-dash/compare/v1.0.0...v1.0.1) - 2015-01-09

### Added

- Pre-commit hook for testing.

### Changed

- Use `atom.commands` and remove old `workspaceView.command` usages.
- Tidied up language map.

## [1.0.0](https://github.com/blakeembrey/atom-dash/compare/v0.0.7...v1.0.0) - 2014-08-18

### Added

- New, fancy badges to the README.

### Changed

- Add CoffeeLint and basic test.
- Use all HTML libraries for Handlebars.

## [0.0.7](https://github.com/blakeembrey/atom-dash/compare/v0.0.6...v0.0.7) - 2014-05-18

### Added

- AngularJS keyword to docsets.

## [0.0.6](https://github.com/blakeembrey/atom-dash/compare/v0.0.5...v0.0.6) - 2014-05-16

### Added

- New keywords for Dash 2.1.

## [0.0.5](https://github.com/blakeembrey/atom-dash/compare/v0.0.4...v0.0.5) - 2014-05-06

### Changed

- Use `shell` module for Atom.

## [0.0.4](https://github.com/blakeembrey/atom-dash/compare/v0.0.3...v0.0.4) - 2014-05-06

### Changed

- Stop using Atom plugin config features and look up using an external docset file instead. Using the Atom config was making it harder to configure.

## [0.0.3](https://github.com/blakeembrey/atom-dash/compare/v0.0.2...v0.0.3) - 2014-03-10

### Changed

- Look up in Dash using the current token instead of word, when not in a comment section.

## [0.0.2](https://github.com/blakeembrey/atom-dash/compare/v0.0.1...v0.0.2) - 2014-03-08

### Changed

- Add Mongoose, Grunt, Rust docsets.

## 0.0.1 - 2014-03-07

### Added

- Initial release for looking up the word under the users cursor in Dash.
