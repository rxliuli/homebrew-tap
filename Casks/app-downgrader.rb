cask "app-downgrader" do
  version "0.0.13"
  sha256 "71f66d0ffaef793cbbba429c4ed2300c0aabfd945fa017e2cd8b0b8e93f719e2"

  url "https://github.com/rxliuli/AppDowngrader/releases/download/v#{version}/AppDowngrader-macos.dmg"
  name "AppDowngrader"
  desc "Downgrade iOS apps to older versions"
  homepage "https://github.com/rxliuli/AppDowngrader"

  # v0.0.13 and later ship arm64 only: the bundled ipatool / go-ios binaries are
  # ~50MB and ~16MB per slice, so carrying x86_64 doubled the DMG (67MB -> 33MB).
  # Failing here keeps Intel users from downloading a disk image whose app cannot
  # launch; they need to stay on v0.0.12 (the last universal build) and pin it.
  depends_on arch: :arm64

  livecheck do
    url :url
    strategy :github_latest
  end

  app "AppDowngrader.app"

  zap trash: [
    "~/Library/Caches/AppDowngrader",
  ]
end
