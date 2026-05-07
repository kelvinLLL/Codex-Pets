# Quick Start

This guide installs a Codex pet from this repository into your local Codex app.

## Requirements

- macOS or Linux shell.
- `git`, or a downloaded ZIP of this repository.
- Codex desktop app.

## Install With The Helper Script

```bash
git clone https://github.com/kelvinLLL/Codex-Pets.git
cd Codex-Pets
./scripts/install-pet.sh marmalade
```

The script copies the pet package to:

```text
${CODEX_HOME:-$HOME/.codex}/pets/marmalade/
```

Then restart Codex and select `Marmalade` from the pet or appearance settings.

The helper script is optional. It only validates the package and copies `pet.json` plus `spritesheet.webp` into the Codex pets folder.

## Install Manually

```bash
git clone https://github.com/kelvinLLL/Codex-Pets.git
mkdir -p "${CODEX_HOME:-$HOME/.codex}/pets"
cp -R Codex-Pets/pets/marmalade "${CODEX_HOME:-$HOME/.codex}/pets/"
```

If you downloaded the repository as a ZIP, unzip it first, then copy the `pets/marmalade` folder into:

```text
${CODEX_HOME:-$HOME/.codex}/pets/
```

This is the same end state as running the helper script:

```text
${CODEX_HOME:-$HOME/.codex}/pets/marmalade/
  pet.json
  spritesheet.webp
```

The folder name should match the `id` field in `pet.json`, and `spritesheetPath` should point to the WebP file relative to that folder.

## Verify The Install

Check that these files exist:

```bash
ls "${CODEX_HOME:-$HOME/.codex}/pets/marmalade"
```

Expected files:

```text
pet.json
spritesheet.webp
```

## Troubleshooting

- If the pet does not show up, fully quit and reopen Codex.
- If `CODEX_HOME` is set, Codex will look under `$CODEX_HOME/pets`; otherwise it uses `$HOME/.codex/pets`.
- If you installed an older version of the same pet, run the install command again to replace `pet.json` and `spritesheet.webp`.
