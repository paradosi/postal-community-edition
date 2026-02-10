# Postal (TBC Anniversary)

<img src="mailicon.png" width="100" height="100" alt="Postal Icon" />

Enhanced mailbox support for World of Warcraft TBC Classic Anniversary.

Based on the original [Postal](https://www.wowace.com/projects/postal) addon, updated and maintained for the TBC Anniversary client.

## Features

Postal is a modular addon — each feature can be individually enabled or disabled from the in-game dropdown menu on the mailbox frame.

| Module | Description |
|---|---|
| **OpenAll** | A button that collects all attachments and gold from mail. Includes filters for AH mail, postmaster mail, and more. Shift-click to override filters and take all mail. |
| **Express** | Shift-click to take item/money, Ctrl-click to return mail, Alt-click to attach items from your inventory. Supports bulk sending and mouse wheel navigation. |
| **BlackBook** | Contact list with autocomplete for friends, guild members, alts, and recent recipients. |
| **Select** | Adds checkboxes to the inbox for batch open and return operations. Shift-click two checkboxes to mass select a range, Ctrl-click to select all mail from one sender. |
| **Wire** | Send gold to other characters. |
| **QuickAttach** | Quickly attach trade goods (cloth, herbs, ore, enchanting mats, etc.) to outgoing mail. Configurable per bag. |
| **DoNotWant** | Skip unwanted mail types when opening. |
| **CarbonCopy** | Copy the contents of a mail. |
| **Forward** | Forward mail contents to another character. |
| **Rake** | Keeps a percentage of COD payments as a fee. |
| **TradeBlock** | Blocks incoming trade requests while the mailbox is open. |

Other features:
- Long subject line tooltips on mouseover
- Configurable mail opening speed
- Per-character profiles with copy/reset support

## Installation

1. Download the latest release from [CurseForge](#) or [GitHub Releases](https://github.com/paradosi/postal_tbc_anniversary/releases).
2. Extract the `Postal` folder into your AddOns directory:
   ```
   World of Warcraft\_anniversary_\Interface\AddOns\Postal
   ```
3. At the character select screen, click **AddOns** and make sure **Postal** is enabled.
4. Open a mailbox in-game. Click the dropdown arrow at the top-right of the mail frame to configure modules.

## Compatibility

- **Client:** TBC Classic Anniversary 2.5.5 (Interface: 20505)
- **Libraries:** Ace3 (bundled) — AceAddon, AceDB, AceEvent, AceHook, AceLocale

## Credits

Originally created by Ammo, Rabbit, Grennon, Mikk, oscarucb, and Jonny (The_Original_Manbot). Maintained for TBC Anniversary by **paradosi@Dreamscythe**.

## Feedback

Please report bugs or suggestions on the [GitHub Issues](https://github.com/paradosi/postal_tbc_anniversary/issues) page. Include your locale and Postal version number when reporting bugs.

## License

MIT. See [LICENSE.txt](LICENSE.txt).
