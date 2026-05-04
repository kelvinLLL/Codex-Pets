#!/usr/bin/env bash
set -euo pipefail

pet_id="${1:-marmalade}"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
source_dir="$repo_root/pets/$pet_id"
dest_root="${CODEX_HOME:-$HOME/.codex}/pets"
dest_dir="$dest_root/$pet_id"

if [[ ! -d "$source_dir" ]]; then
  echo "Pet not found: $pet_id" >&2
  echo "Available pets:" >&2
  find "$repo_root/pets" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort >&2
  exit 1
fi

if [[ ! -f "$source_dir/pet.json" || ! -f "$source_dir/spritesheet.webp" ]]; then
  echo "Invalid pet package: expected pet.json and spritesheet.webp in $source_dir" >&2
  exit 1
fi

python3 -m json.tool "$source_dir/pet.json" >/dev/null

mkdir -p "$dest_dir"
cp "$source_dir/pet.json" "$source_dir/spritesheet.webp" "$dest_dir/"

echo "Installed $pet_id to $dest_dir"
echo "Restart Codex, then choose the pet from the pet or appearance settings."
