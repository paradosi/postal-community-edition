# Changelog

All notable changes to Postal (TBC Anniversary) will be documented in this file.

## 4.4.6 — 2026-11-09

**This is the final release.** Postal Community Edition is retired and will receive no further updates. The original [Postal](https://www.curseforge.com/wow/addons/postal) and its other forks remain available.

### Fixed
- WoW Forever: the Alts menu now saves and sends to your characters' full names ("First Last"). It used to use the first name alone, which could send mail to someone else or fail. Each character's old entry is replaced the next time you log into it
- WoW Forever: mail picked from the alt lists or autocomplete no longer adds a realm name, which Forever's names don't need
- WoW Forever: Postal now recognises your own character, so it no longer offers or auto-fills your own name as a recipient

## 4.4.5 — 2026-11-05

### Added
- **WoW Forever support.** Forever's mailbox is built differently from the other clients', so Select, Do Not Want, Open All and Carbon Copy now hook it the way it works there. Quick Attach shows Forever's trade goods categories, and reagent bags and Battle.net friend autocomplete work as they do on Retail.

### Fixed
- Open All and the Select "Open" button no longer hang on "In Progress" when your bags fill up or a mail holds a unique item you already have. Postal never noticed the game's "inventory full" error
- Forward: forwarding a mail that has text no longer causes a Lua error on TBC Anniversary and Classic Era
- Forward no longer pulls items from the next mail when the forwarded mail is deleted after being emptied
- Forward: a mail whose items aren't cached yet no longer errors when you open it
- Retail: the Alt-Click and Control-Click hints now appear on item tooltips at the mailbox
- Retail: Alt-Click no longer attaches or sends an item once per mailbox visit so far this session, and turning off "Enable Alt-Click to send mail" now actually turns it off
- Do Not Want: if new mail arrives while the delete confirmation is open, Postal no longer deletes whichever mail has moved into that spot. It deletes nothing and asks you to try again
- Trade Block: trades you block yourself in the game options stay blocked after you leave the mailbox, and guild charter petitions are no longer left blocked after a mailbox visit
- Quick Attach: clearing the last default recipient no longer resets your bag choices
- The New Profile and Quick Attach recipient dialogs read the right text box when another popup is already open
- Russian client: the Wire subject no longer shows stray "+" signs
- Copying or returning a mail with no subject no longer causes a Lua error
- Opening Help no longer reports a "Missing entry" locale error, and its bug-report link points at this project

### Changed
- Removed leftover translations for a Mr.Plow option and an old CurseForge bug-report link that no longer exist
- Library test files are no longer shipped in the download
- Open All and Select share their bag-space checks, and Quick Attach builds its button lists from one shared table, instead of each keeping its own copy

## 4.4.4 — 2026-11-05

### Changed
- Updated for the current clients (Retail 12.1.5, TBC Anniversary 2.5.6 and Classic Era 1.15.9), so the addon no longer shows as out of date
- Release notes on CurseForge and Wago are now this changelog instead of the commit log

## 4.4.3 — 2026-09-02

### Fixed
- **Your own character appeared in the paginated all-realms alt menu** — `BlackBook.lua` declared `plre` (player-realm) inside the `allalt` branch but read it in the `aapart` and `sapart` branches, where it was out of scope and therefore `nil`. The guard `pr ~= plre` was always true, so the filter that hides the current character never fired. Only visible on accounts with more than 25 alts, which is when those paginated submenus appear. Note the same-realm (`sapart`) list was unaffected in practice, because `altstable` is already built with the current character excluded.
- **Removed an undefined-global read** in the `delsapart` branch: `p = all and p.."-"..r or p` referenced an `all` that is not in scope there. It happened to behave correctly, because same-realm lists are never realm-qualified and the nil read evaluated the same as `false`, but it would have broken had any other addon defined a global named `all`.

### Packaging
- **`X-Wago-ID` was only in `Postal_TBC.toc`.** The BigWigs packager reads metadata from the TOC matching `package-as` — `Postal.toc` — which carried neither a Wago nor a CurseForge id, so releases had no Wago upload target. The id is now in all six TOC files. There is still no `X-Curse-Project-ID` anywhere; add one if a CurseForge project exists.

### Code Cleanup
- Removed the orphaned `Express.MouseWheel` default. It was the addon's only reference to itself — Express has no mousewheel handling and the key was never exposed in any menu. Leftover from upstream Postal.

---

## [4.3.13] - 2026-02-17

### Fixed
- **Cross-version compatibility**: Added safe wrappers for all container and item APIs that differ between WoW versions
  - `C_Container.GetContainerNumFreeSlots` / `GetContainerNumFreeSlots`
  - `C_Container.GetContainerNumSlots` / `GetContainerNumSlots`
  - `C_Container.GetContainerItemID` / `GetContainerItemID`
  - `C_Container.PickupContainerItem` / `PickupContainerItem`
  - `C_Container.GetContainerFreeSlots` / `GetContainerFreeSlots`
  - `C_Item.GetItemInfo` / `GetItemInfo`
  - `C_Item.GetItemCount` / `GetItemCount`
- **Select.lua**: Replaced all hardcoded `C_Container` and `C_Item` calls with safe compat wrappers
- **OpenAll.lua**: Replaced direct `C_Container.GetContainerItemInfo` and `C_Item` calls with compat wrappers; added nil guard for `OpenAllMail` (may not exist on all clients)
- **Express.lua**: Replaced `C_Item.GetItemInfo` calls with safe wrapper
- **Forward.lua**: Replaced all `C_Container` and `C_Item` calls with safe wrappers; removed version-branching `if/else` blocks
- **QuickAttach.lua**: Replaced `C_Item.GetItemInfo` call with safe wrapper

## [4.3.12] - 2026-02-15

### Fixed
- **Rake module**: Gold collected summary now prints correctly in TBC Anniversary (Fixes #2)
  - `MAIL_CLOSED` event does not fire in TBC Anniversary; replaced with `MailFrame:OnHide` hook

## [4.3.11] - 2026-02-15

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
