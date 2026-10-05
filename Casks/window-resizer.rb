cask "window-resizer" do
  version "0.3.2"
  sha256 "d585c25ce8fd5b456c1d98390043eff42e3f2f93f5aad1ad7ea04194085a6516"

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
