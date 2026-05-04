# Pet Package Format

Each pet lives in its own folder under `pets/<pet-id>/`.

```text
pets/<pet-id>/
  pet.json
  spritesheet.webp
```

## `pet.json`

```json
{
  "id": "marmalade",
  "displayName": "Marmalade",
  "description": "A lazy orange tabby companion with heavy-lidded charm, snack-first priorities, and deadpan nap energy.",
  "spritesheetPath": "spritesheet.webp"
}
```

Fields:

- `id`: Stable folder-safe pet id. This should match the folder name.
- `displayName`: Human-readable name shown in Codex.
- `description`: Short pet description.
- `spritesheetPath`: Relative path to the spritesheet file.

## Spritesheet

The spritesheet is a transparent-capable WebP atlas:

- Size: `1536x1872`
- Cell size: `192x208`
- Grid: `8` columns by `9` rows
- Used rows:
  - row 0: `idle`, 6 frames
  - row 1: `running-right`, 8 frames
  - row 2: `running-left`, 8 frames
  - row 3: `waving`, 4 frames
  - row 4: `jumping`, 5 frames
  - row 5: `failed`, 8 frames
  - row 6: `waiting`, 6 frames
  - row 7: `running`, 6 frames
  - row 8: `review`, 6 frames

Unused cells should be fully transparent.

## Preview And QA Files

Preview files are not required for installation, but they help people inspect a pet before installing it:

```text
previews/<pet-id>/
  contact-sheet.png
  review.json
  run-summary.json
  videos/*.mp4
```
