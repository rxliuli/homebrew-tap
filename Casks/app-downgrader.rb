cask "app-downgrader" do
  version "0.0.7"
  sha256 "553811adfc069564660bfc7bef26b59f85e50de79745c1c35f1e8a053e6ff344"

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
