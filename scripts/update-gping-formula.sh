#!/usr/bin/env bash
set -euo pipefail

source_dir=${1:-gping-source}
formula_path=${2:-Formula/gping-patched.rb}
repository=${GPING_REPOSITORY:-egigoka/gping}

commit=$(git -C "$source_dir" rev-parse HEAD)
commit_timestamp=$(git -C "$source_dir" show -s --format=%ct HEAD)
base_version=$(
  sed -n '/^\[package\]/,/^\[/s/^version = "\([^"]*\)"/\1/p' \
    "$source_dir/gping/Cargo.toml" |
    head -1
)

if [[ -z "$base_version" ]]; then
  echo "Could not read gping package version" >&2
  exit 1
fi

formula_version="${base_version}-patched.${commit_timestamp}"
archive_url="https://github.com/${repository}/archive/${commit}.tar.gz"
archive_path=$(mktemp "${TMPDIR:-/tmp}/gping-patched.XXXXXX")
trap 'rm -f "$archive_path"' EXIT

curl \
  --fail \
  --location \
  --retry 5 \
  --silent \
  --show-error \
  "$archive_url" \
  --output "$archive_path"
sha256=$(shasum -a 256 "$archive_path" | awk '{print $1}')

ruby - "$formula_path" "$archive_url" "$formula_version" "$sha256" <<'RUBY'
path, archive_url, version, sha256 = ARGV
content = File.read(path)
replacements = {
  /^  url ".*"$/ => %(  url "#{archive_url}"),
  /^  version ".*"$/ => %(  version "#{version}"),
  /^  sha256 ".*"$/ => %(  sha256 "#{sha256}"),
}

replacements.each do |pattern, replacement|
  abort "Expected one #{pattern.inspect} line in #{path}" unless content.scan(pattern).length == 1

  content.sub!(pattern, replacement)
end

File.write(path, content)
RUBY

echo "version=$formula_version"
echo "commit=$commit"
echo "sha256=$sha256"
