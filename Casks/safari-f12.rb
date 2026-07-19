cask "safari-f12" do
  version "0.1.0"
  sha256 "PLACEHOLDER_UPDATED_BY_CI"

  url "https://github.com/rxliuli/safari-f12/releases/download/v#{version}/SafariF12-macos.dmg"
  name "SafariF12"
  desc "Press F12 in Safari to toggle Web Inspector, like Chrome"
  homepage "https://github.com/rxliuli/safari-f12"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "SafariF12.app"

  zap trash: [
    "~/Library/Preferences/com.rxliuli.safari-f12.plist",
  ]
end
