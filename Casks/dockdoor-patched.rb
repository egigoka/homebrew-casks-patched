cask "dockdoor-patched" do
  version "1.39.3-patched"
  sha256 "983e94cf559e5e676b045d4eb011eea5bde4842ed37d0e1f2ddcda0201303468"

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
