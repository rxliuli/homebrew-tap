cask "app-downgrader" do
  version "0.0.6"
  sha256 "41566243a0a1dac4097a2db04f0cbe938f1e59d93f332744328a7baf880385c5"

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
