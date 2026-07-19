cask "safari-f12" do
  version "0.1.5"
  sha256 "c66e8d56600ea16336cfebf9561a2f8b4e36e7758767a0585f123f575eb0cffe"

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
