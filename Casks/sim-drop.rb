cask "sim-drop" do
  version "0.0.7"
  sha256 "486f5451649874e6114da29862a9e2fe795c2f088a7fd5e41edf628e22af9278"

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

  # Removing the helper's launchd job must not happen on a plain uninstall: `brew upgrade`
  # runs the old version's uninstall first, which would leave the helper dead.
  zap launchctl: "com.rxliuli.sim-drop.helper",
      trash:     [
        "~/Library/Application Scripts/com.rxliuli.sim-drop.FileProvider",
        "~/Library/Containers/com.rxliuli.sim-drop.FileProvider",
        "~/Library/Group Containers/N2X78TUUFG.com.rxliuli.sim-drop",
      ]

  caveats <<~EOS
    After installing or upgrading, open SimDrop once. Replacing the app makes macOS
    drop its Finder extension and stop its background helper until the new version
    has been launched.
  EOS
end
