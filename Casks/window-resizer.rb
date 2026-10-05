cask "window-resizer" do
  version "0.3.3"
  sha256 "5a65f580e8e644009b534553c3bffdf985781d7c200c558926ce7f42afc74ae7"

  url "https://github.com/rxliuli/window-resizer/releases/download/v#{version}/WindowResizer-macos.dmg"
  name "WindowResizer"
  desc "Menu bar utility to resize the active window to preset dimensions"
  homepage "https://github.com/rxliuli/window-resizer"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "WindowResizer.app"

  zap trash: [
    "~/Library/Logs/window-resizer",
    "~/Library/Preferences/window-resizer",
  ]
end
