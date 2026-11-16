cask "sim-drop" do
  version "0.0.1"
  sha256 "dc2b192ba3634d150a1a2d314d9656cf6f835ac4e5e2a6d92e15ff2ec57ced1e"

  url "https://github.com/rxliuli/sim-drop/releases/download/v#{version}/SimDrop-macos.dmg"
  name "SimDrop"
  desc "Shows running iOS simulators in the Finder sidebar for drag-and-drop transfer"
  homepage "https://github.com/rxliuli/sim-drop"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"

  app "SimDrop.app"

  uninstall launchctl: "com.rxliuli.sim-drop.helper"

  zap trash: [
    "~/Library/Application Scripts/com.rxliuli.sim-drop.FileProvider",
    "~/Library/Containers/com.rxliuli.sim-drop.FileProvider",
    "~/Library/Group Containers/N2X78TUUFG.com.rxliuli.sim-drop",
  ]
end
