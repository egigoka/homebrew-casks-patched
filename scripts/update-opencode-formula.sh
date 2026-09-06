#!/usr/bin/env bash
set -euo pipefail

formula_path=${1:-Formula/opencode-patched.rb}
repository=${OPENCODE_REPOSITORY:-egigoka/opencode}

release_json=$(gh api "repos/${repository}/releases/latest")
tag=$(ruby -rjson -e 'puts JSON.parse(STDIN.read).fetch("tag_name")' <<<"$release_json")
version=${tag#v}

if [[ -z "$version" ]]; then
  echo "Could not read latest release tag" >&2
  exit 1
fi

darwin_arm_asset="opencode-darwin-arm64.zip"
darwin_intel_asset="opencode-darwin-x64.zip"
linux_arm_asset="opencode-linux-arm64.tar.gz"
linux_arm_musl_asset="opencode-linux-arm64-musl.tar.gz"
linux_intel_asset="opencode-linux-x64.tar.gz"
linux_intel_musl_asset="opencode-linux-x64-musl.tar.gz"

checksums_url=$(ruby -rjson -e '
  release = JSON.parse(STDIN.read)
  asset = release.fetch("assets").find { |a| a.fetch("name") == "SHA256SUMS" }
  abort "SHA256SUMS asset missing from latest release" if asset.nil?
  puts asset.fetch("browser_download_url")
' <<<"$release_json")

checksums_path=$(mktemp "${TMPDIR:-/tmp}/opencode-checksums.XXXXXX")
trap 'rm -f "$checksums_path"' EXIT

curl \
  --fail \
  --location \
  --retry 5 \
  --silent \
  --show-error \
  "$checksums_url" \
  --output "$checksums_path"

sha_for() {
  local file=$1
  awk -v file="$file" '$2 == file || $2 == "./" file { print $1; exit }' "$checksums_path"
}

darwin_arm_sha=$(sha_for "$darwin_arm_asset")
darwin_intel_sha=$(sha_for "$darwin_intel_asset")
linux_arm_sha=$(sha_for "$linux_arm_asset")
linux_arm_musl_sha=$(sha_for "$linux_arm_musl_asset")
linux_intel_sha=$(sha_for "$linux_intel_asset")
linux_intel_musl_sha=$(sha_for "$linux_intel_musl_asset")

for asset in "$darwin_arm_asset" "$darwin_intel_asset" "$linux_arm_asset" "$linux_arm_musl_asset" "$linux_intel_asset" "$linux_intel_musl_asset"; do
  if [[ -z "$(sha_for "$asset")" ]]; then
    echo "Checksum missing for $asset in $tag" >&2
    exit 1
  fi
done

export FORMULA_PATH="$formula_path"
export RELEASE_TAG="$tag"
export FORMULA_VERSION="$version"
export REPOSITORY="$repository"
export DARWIN_ARM_ASSET="$darwin_arm_asset"
export DARWIN_ARM_SHA="$darwin_arm_sha"
export DARWIN_INTEL_ASSET="$darwin_intel_asset"
export DARWIN_INTEL_SHA="$darwin_intel_sha"
export LINUX_ARM_ASSET="$linux_arm_asset"
export LINUX_ARM_SHA="$linux_arm_sha"
export LINUX_ARM_MUSL_ASSET="$linux_arm_musl_asset"
export LINUX_ARM_MUSL_SHA="$linux_arm_musl_sha"
export LINUX_INTEL_ASSET="$linux_intel_asset"
export LINUX_INTEL_SHA="$linux_intel_sha"
export LINUX_INTEL_MUSL_ASSET="$linux_intel_musl_asset"
export LINUX_INTEL_MUSL_SHA="$linux_intel_musl_sha"

ruby <<'RUBY'
formula_path = ENV.fetch("FORMULA_PATH")
tag = ENV.fetch("RELEASE_TAG")
version = ENV.fetch("FORMULA_VERSION")
repository = ENV.fetch("REPOSITORY")

blocks = {
  "DARWIN_ARM" => [ENV.fetch("DARWIN_ARM_ASSET"), ENV.fetch("DARWIN_ARM_SHA")],
  "DARWIN_INTEL" => [ENV.fetch("DARWIN_INTEL_ASSET"), ENV.fetch("DARWIN_INTEL_SHA")],
  "LINUX_ARM" => [ENV.fetch("LINUX_ARM_ASSET"), ENV.fetch("LINUX_ARM_SHA")],
  "LINUX_ARM_MUSL" => [ENV.fetch("LINUX_ARM_MUSL_ASSET"), ENV.fetch("LINUX_ARM_MUSL_SHA")],
  "LINUX_INTEL" => [ENV.fetch("LINUX_INTEL_ASSET"), ENV.fetch("LINUX_INTEL_SHA")],
  "LINUX_INTEL_MUSL" => [ENV.fetch("LINUX_INTEL_MUSL_ASSET"), ENV.fetch("LINUX_INTEL_MUSL_SHA")],
}

blocks.each do |name, (asset, sha)|
  abort "Missing checksum for #{asset}" if sha.nil? || sha.empty?
end

url_for = ->(asset) { "https://github.com/#{repository}/releases/download/#{tag}/#{asset}" }

content = <<~FORMULA
  class OpencodePatched < Formula
    desc "AI coding agent for the terminal"
    homepage "https://github.com/#{repository}"
    version "#{version}"
    license "MIT"

    depends_on "ripgrep"

    on_macos do
      on_arm do
        url "#{url_for.call(blocks["DARWIN_ARM"].first)}"
        sha256 "#{blocks["DARWIN_ARM"].last}"
      end
      on_intel do
        url "#{url_for.call(blocks["DARWIN_INTEL"].first)}"
        sha256 "#{blocks["DARWIN_INTEL"].last}"
      end
    end

    on_linux do
      on_arm do
        if File.exist?("/etc/alpine-release")
          url "#{url_for.call(blocks["LINUX_ARM_MUSL"].first)}"
          sha256 "#{blocks["LINUX_ARM_MUSL"].last}"
        else
          url "#{url_for.call(blocks["LINUX_ARM"].first)}"
          sha256 "#{blocks["LINUX_ARM"].last}"
        end
      end
      on_intel do
        if File.exist?("/etc/alpine-release")
          url "#{url_for.call(blocks["LINUX_INTEL_MUSL"].first)}"
          sha256 "#{blocks["LINUX_INTEL_MUSL"].last}"
        else
          url "#{url_for.call(blocks["LINUX_INTEL"].first)}"
          sha256 "#{blocks["LINUX_INTEL"].last}"
        end
      end
    end

    conflicts_with "opencode", because: "both install an `opencode` binary"

    def install
      bin.install "opencode"
    end

    test do
      assert_match version.to_s, shell_output("\#{bin}/opencode --version")
    end
  end
FORMULA

File.write(formula_path, content)
RUBY

echo "version=$version"
echo "tag=$tag"
