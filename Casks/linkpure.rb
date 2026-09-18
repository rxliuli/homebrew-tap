cask "linkpure" do
  version "0.6.7"
  sha256 "5b2e19c51ac20972a7db6f372edc8242febf4c05cdbd4e98dedde7a7f8c0b63e"

  url "https://github.com/rxliuli/LinkPure/releases/download/v#{version}/LinkPure-macos.dmg"
  name "LinkPure"
  desc "Rewrites clipboard URLs using user-defined rules"
  homepage "https://github.com/rxliuli/LinkPure"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"

  app "LinkPure.app"

  caveats <<~EOS
    This cask installs the direct-distribution build of an app whose bundle id is
    identical to the Mac App Store version (com.rxliuli.linkpure2). Installing both
    will overwrite each other, so uninstall the other one first.
  EOS

  zap trash: [
    "~/Library/Containers/com.rxliuli.linkpure2",
    "~/Library/Preferences/com.rxliuli.linkpure2.plist",
    "~/Library/Saved Application State/com.rxliuli.linkpure2.savedState",
  ]
end
