cask "sim-drop" do
  version "0.0.2"
  sha256 "a3e5aa8664797fe162e6062dd948337fa3709e38480d037e644c77b63f2385fe"

  url "https://github.com/rxliuli/sim-drop/releases/download/v#{version}/SimDrop-macos.dmg"
  name "SimDrop"
  desc "Shows running iOS simulators in the Finder sidebar for drag-and-drop transfer"
  homepage "https://github.com/rxliuli/sim-drop"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "SimDrop.app"

  uninstall launchctl: "com.rxliuli.sim-drop.helper"

  zap trash: [
    "~/Library/Application Scripts/com.rxliuli.sim-drop.FileProvider",
    "~/Library/Containers/com.rxliuli.sim-drop.FileProvider",
    "~/Library/Group Containers/N2X78TUUFG.com.rxliuli.sim-drop",
  ]
end
