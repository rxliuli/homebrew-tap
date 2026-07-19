cask "window-resizer" do
  version "0.3.0"
  sha256 "80d2c6f9c24a17623c21522c1992979e2b3fad08e95963790b666296f81ea406"

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
