# Codex Pets

Custom pet packages for the Codex desktop app.

## Quick Install

```bash
git clone https://github.com/kelvinLLL/Codex-Pets.git
cd Codex-Pets
./scripts/install-pet.sh marmalade
```

Restart Codex after installation, then choose `Marmalade` from the pet or appearance settings.

## Do You Need The Installer?

No. `scripts/install-pet.sh` is only a small convenience helper. It does not call a private Codex registry, write hidden app settings, or perform a special `petinstall` step.

What the helper does:

- Finds the pet folder in this repo.
- Checks that `pet.json` and `spritesheet.webp` both exist.
- Validates that `pet.json` is parseable JSON.
- Copies those two required files into the Codex pets folder.

Codex pets work much like skills in the practical sense: a complete pet package can be placed directly under the expected local folder, then Codex should be restarted so the app reloads available pets.

## Manual Install

If you do not want to run the helper script:

```bash
git clone https://github.com/kelvinLLL/Codex-Pets.git
mkdir -p "${CODEX_HOME:-$HOME/.codex}/pets"
cp -R Codex-Pets/pets/marmalade "${CODEX_HOME:-$HOME/.codex}/pets/"
```

The installed folder should contain:

```text
${CODEX_HOME:-$HOME/.codex}/pets/marmalade/
  pet.json
  spritesheet.webp
```

## How Codex Finds Pets

Codex looks for custom pet folders under:

```text
${CODEX_HOME:-$HOME/.codex}/pets/
```

If `CODEX_HOME` is not set, that resolves to:

```text
$HOME/.codex/pets/
```

Each pet gets one folder named after its stable pet id:

```text
$HOME/.codex/pets/<pet-id>/
  pet.json
  spritesheet.webp
```

For Marmalade, that means:

```text
$HOME/.codex/pets/marmalade/
  pet.json
  spritesheet.webp
```

The `pet.json` file points Codex to the spritesheet with a relative path:

```json
{
  "id": "marmalade",
  "displayName": "Marmalade",
  "description": "A lazy orange tabby companion with heavy-lidded charm, snack-first priorities, and deadpan nap energy.",
  "spritesheetPath": "spritesheet.webp"
}
```

The folder name and `id` should match. `spritesheetPath` should stay relative to the pet folder, so `spritesheet.webp` means "load the WebP file sitting next to this `pet.json`".

## Pets

| Pet | Description | Package | Preview |
| --- | --- | --- | --- |
| Marmalade | A lazy orange tabby companion with heavy-lidded charm, snack-first priorities, and deadpan nap energy. | `pets/marmalade` | `previews/marmalade/contact-sheet.png` |

![Marmalade contact sheet](previews/marmalade/contact-sheet.png)

## Repository Layout

```text
pets/
  marmalade/
    pet.json
    spritesheet.webp
previews/
  marmalade/
    contact-sheet.png
    review.json
    run-summary.json
    videos/*.mp4
docs/
  quick-start.md
  pet-format.md
scripts/
  install-pet.sh
```

## Notes

- These are custom fan-made/generated Codex pet assets, not official Codex built-ins.
- Restart Codex after installing or replacing a pet so the app reloads local pet packages.
- Keep `pet.json` and `spritesheet.webp` together in the same pet folder.
- The preview images, QA JSON, and videos are useful for inspection, but they are not required for installation.
