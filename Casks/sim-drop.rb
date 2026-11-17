cask "sim-drop" do
  version "0.0.3"
  sha256 "b2adc556d86c32ba2c625cba140d8160c297ea56e86269c5138edd8825ef0896"

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

  # Registers / restarts the background helper after every install and upgrade, without
  # showing UI. (Removing the helper's launchd job must not happen on a plain uninstall:
  # `brew upgrade` runs the old version's uninstall first, which would leave it dead.)
  postflight_steps do
    run "/usr/bin/open", args: ["-g", "-j", "{{appdir}}/SimDrop.app", "--args", "-setupOnly", "YES"]
  end

  zap launchctl: "com.rxliuli.sim-drop.helper",
      trash:     [
        "~/Library/Application Scripts/com.rxliuli.sim-drop.FileProvider",
        "~/Library/Containers/com.rxliuli.sim-drop.FileProvider",
        "~/Library/Group Containers/N2X78TUUFG.com.rxliuli.sim-drop",
      ]
end
