cask "app-downgrader" do
  version "0.0.5"
  sha256 "68d7dc1556fba81f54722f2877af79ac8e1fcd1eadd1b530db9476f29ac5db35"

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
