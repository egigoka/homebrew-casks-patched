cask "dockdoor-patched" do
  version "1.39.5-patched"
  sha256 "cac494ea3edfd0bf39ab54176a9a8d9ea9e112308049c0e82818e5faae95c03c"

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
