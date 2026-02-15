# Changelog

All notable changes to Postal (TBC Anniversary) will be documented in this file.

## [4.3.10] - 2026-02-15

### Fixed
- Added `#@no-lib-strip@` tags to TBC TOC to prevent duplicate Ace3 libs in packaged releases
- Extracted shared `GetContainerItemInfoCompat()` to core `Postal.lua` — removes duplicate definitions in Express and QuickAttach modules
- Added nil guard for version string in TBC welcome message

### Added
- CHANGELOG.md for GitHub release tracking

## [4.3.9] - 2026-02-09

### Fixed
- Removed leading "v" from TBC version metadata to avoid "vv" display (r668)

## [4.3.8] - 2026-02-09

### Changed
- Updated author to paradosi@Dreamscythe (r667)
- Added TBC welcome message on addon load
- Added GitHub link in help/about text

## [4.3.7] - 2026-02-09

### Fixed
- Express module container API calls for Classic compatibility (r666)

## [4.3.6] - 2026-02-09

### Fixed
- OpenAll reset handler fix (r665)
- Added Classic-safe container fallbacks
- Cached item info in QuickAttach
- Guarded popup fallbacks

## [4.3.5] - 2026-02-09

### Changed
- TBC Anniversary interface update to 20505 (r664)
- Added AddOn metadata fallback for Classic
- Cleaned up TradeBlock addon check

## [4.3.4] - 2025-10-29

### Changed
- Upstream Postal release (r663)
- MOP TOC update
