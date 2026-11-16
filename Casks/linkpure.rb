cask "linkpure" do
  version "0.6.8"
  sha256 "1c56071065d19b390681b87d7c57781bbd1d3d357a62b6a5c98a8e3ae04a63c8"

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
