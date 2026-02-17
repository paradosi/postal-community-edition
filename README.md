# Postal

<img src="https://github.com/paradosi/postal_tbc_anniversary/blob/main/media/art/mailicon.png?raw=true" width="100" height="100" alt="Postal Icon" />

**Enhanced mailbox support for World of Warcraft.**

Postal replaces and extends the default mailbox UI with batch operations, one-click looting, contact management, and much more. Every feature is modular — enable only what you need from the in-game dropdown menu on the mailbox frame.

Based on the original [Postal](https://www.wowace.com/projects/postal) addon, updated and maintained for modern WoW clients by **paradosi@Dreamscythe**.

## Supported WoW Versions

| Version | Interface | Status |
|---|---|---|
| TBC Classic Anniversary | 20505 | ✅ Primary target |
| Classic Era (Vanilla) | 11508 | ✅ Supported |
| Mists of Pandaria Anniversary | 50502 | ✅ Supported |
| Retail (The War Within) | 110205 | ✅ Supported |
| Wrath of the Lich King Classic | 30403 | ⚠️ TOC included, servers currently offline |
| Cataclysm Classic | 40402 | ⚠️ TOC included, servers currently offline |

All container and item APIs use cross-version compatibility wrappers, so a single codebase runs on every client.

## Features

### OpenAll
A button that collects all attachments and gold from your inbox in one click. Includes filters for AH cancelled/expired/outbid/sold/won mail, postmaster deliveries, and general attachments. Shift-click the button to override all filters and take everything. Automatically refreshes the mailbox when more mail is waiting on the server.

### Select
Adds checkboxes to the inbox for batch open and return operations. Shift-click two checkboxes to mass-select every mail in between. Ctrl-click a checkbox to select/deselect all mail from that sender. Skips CoD and GM mail automatically.

### Express
Mouse-click shortcuts for mail. Shift-click to take an item or money from a message. Ctrl-click to return mail to the sender. Alt-click an item in your bags to attach it to the current outgoing mail. Ctrl-click a bag item to bulk-attach similar items. Includes multi-item tooltips for messages with more than one attachment.

### BlackBook
Contact list with auto-complete. Automatically fills the recipient field from your recent contacts, friends list, guild roster, and alts across all characters. Contacts can be manually added and managed.

### Wire
Send gold to other characters quickly, directly from the mailbox UI.

### QuickAttach
Quickly attach trade goods to outgoing mail — cloth, herbs, ore, leather, enchanting materials, gems, and more. Configurable per bag slot. Recognizes trade good categories across all WoW versions.

### Rake
Displays a running total of gold collected during your mailbox session.

### Forward
Forward mail (including attachments) to another character. Automatically moves items through your inventory to the outgoing mail.

### CarbonCopy
Copy the subject and body text of a received mail for easy forwarding or record-keeping.

### DoNotWant
Mark specific mail types to skip when using Open All, giving you finer control over what gets looted.

### TradeBlock
Blocks incoming trade requests while the mailbox is open, preventing accidental interruptions.

### Other Features
- **Long subject tooltips** — hover over truncated subject lines to see the full text
- **Configurable opening speed** — adjust the delay between processing each mail (0.00s to 5.00s)
- **Profile system** — per-character profiles with copy, reset, and default options
- **Chat output control** — choose which chat frame receives Postal messages
- **Verbose/quiet mode** — toggle chat spam during batch operations

## Installation

### From CurseForge / Wago

1. Search for **Postal** on [CurseForge](https://www.curseforge.com/wow/addons) or [Wago Addons](https://addons.wago.io/addons/postal).
2. Install via the CurseForge or Wago app, or download manually.
3. Make sure to select the correct game version (TBC Anniversary, Classic Era, Retail, etc.).

### Manual Installation

1. Download the latest release from [GitHub Releases](https://github.com/paradosi/postal_tbc_anniversary/releases).
2. Extract the folder into your WoW AddOns directory. For TBC Anniversary:
   ```
   World of Warcraft/_anniversary_/Interface/AddOns/postal_tbc_anniversary/
   ```
   For other clients, use the appropriate game folder (`_classic_era_`, `_retail_`, etc.).
3. At the character select screen, click **AddOns** and ensure **Postal** is enabled.
4. Open a mailbox in-game. Use the dropdown arrow button at the top-right of the mail frame to configure modules and options.

## Known Issues

- On TBC Anniversary, `GetInboxHeaderInfo` does not reliably return the `wasRead` flag. Postal works around this by checking inbox count instead.
- The `MAIL_CLOSED` event does not fire on TBC Anniversary. Postal uses `PLAYER_INTERACTION_MANAGER_FRAME_HIDE` or `MailFrame:OnHide` hooks as alternatives.
- Blizzard's `OpenAllMail` button may not exist on all clients. Postal handles this gracefully with nil guards.
- If you encounter errors with container or item APIs on a specific client, please report them with your WoW version.

## Bug Reports & Suggestions

Please report issues on the [GitHub Issues](https://github.com/paradosi/postal_tbc_anniversary/issues) page. When reporting bugs, include:
- Your WoW client version (e.g., TBC Anniversary 2.5.5)
- Your locale (e.g., enUS, deDE)
- Postal version number (visible in the Help/About panel)
- The full error message, if any

## Credits

**Maintainer:** paradosi@Dreamscythe

**Original Postal authors:** Ammo, Rabbit, Grennon, Mikk, oscarucb, Jonny (The_Original_Manbot)

## Libraries

- [Ace3](https://www.wowace.com/projects/ace3) — AceAddon, AceDB, AceEvent, AceHook, AceLocale (bundled)

## License

MIT. See [LICENSE.txt](LICENSE.txt).

---

[![Buy Me A Coffee](https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20coffee&emoji=&slug=paradosi&button_colour=5F7FFF&font_colour=ffffff&font_family=Cookie&outline_colour=000000&coffee_colour=FFDD00)](https://www.buymeacoffee.com/paradosi)
