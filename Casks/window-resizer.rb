cask "window-resizer" do
  version "0.3.1"
  sha256 "ee3b0c1d00b41f1a4488ba40b92110740ffe9ff8820a6b9dc1514e4ae7175e5e"

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
