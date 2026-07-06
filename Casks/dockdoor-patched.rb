cask "dockdoor-patched" do
  version "1.39.4-patched"
  sha256 "be4861928487adfc0cbc560320a21439ed63baaffc2eb1b15c5b04448beb4ec7"

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
