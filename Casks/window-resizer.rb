cask "window-resizer" do
  version "0.2.6"
  sha256 "7ac9cc6f1c777205106307f3b390d95f0c408db573d6b14eb15627a545db4738"

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
