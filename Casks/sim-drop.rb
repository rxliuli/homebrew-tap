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

  # Registers / restarts the background helper after every install and upgrade, without
  # showing UI. (Removing the helper's launchd job must not happen on a plain uninstall:
  # `brew upgrade` runs the old version's uninstall first, which would leave it dead.)
  postflight do
    system_command "/usr/bin/open",
                   args: ["-g", "-j", "#{appdir}/SimDrop.app", "--args", "-setupOnly", "YES"]
  end

  zap launchctl: "com.rxliuli.sim-drop.helper",
      trash:     [
        "~/Library/Application Scripts/com.rxliuli.sim-drop.FileProvider",
        "~/Library/Containers/com.rxliuli.sim-drop.FileProvider",
        "~/Library/Group Containers/N2X78TUUFG.com.rxliuli.sim-drop",
      ]
end
