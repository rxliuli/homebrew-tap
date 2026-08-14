cask "appdowngrader" do
  version "0.0.1"
  sha256 "77c0d19d8e2eaaebcae9240c2332469e8b2f54979a4ef286729cb00875fc6163"

  url "https://github.com/rxliuli/AppDowngrader/releases/download/v#{version}/AppDowngrader-macos.dmg"
  name "AppDowngrader"
  desc "Downgrade iOS apps to older versions"
  homepage "https://github.com/rxliuli/AppDowngrader"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "AppDowngrader.app"

  zap trash: [
    "~/Library/Caches/AppDowngrader",
  ]
end
