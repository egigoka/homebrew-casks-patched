cask "dockdoor-patched" do
  version "1.39.3-patched"
  sha256 "44081bba7563a3e3e5b2f8233ead1a2f783deb1e6dccc1d728071a5c3efc456e"

  url "https://github.com/egigoka/DockDoor/releases/download/#{version}/DockDoor-patched.dmg"
  name "DockDoor Patched"
  desc "DockDoor with mouse cursor movement code removed"
  homepage "https://github.com/egigoka/DockDoor"

  livecheck do
    url :url
    regex(/^(\d+(?:\.\d+)+-patched)$/i)
  end

  auto_updates true
  depends_on macos: :ventura

  app "DockDoor.app"

  zap trash: [
    "~/Library/Application Support/DockDoor",
    "~/Library/Caches/com.ethanbills.DockDoor",
    "~/Library/HTTPStorages/com.ethanbills.DockDoor",
    "~/Library/Preferences/com.ethanbills.DockDoor.plist",
  ]
end
