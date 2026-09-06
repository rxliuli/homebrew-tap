cask "app-downgrader" do
  version "0.0.3"
  sha256 "003bf9e842dee92310b14bff1e775c170ce799c5f986f454cf8e5af1d525b45a"

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
