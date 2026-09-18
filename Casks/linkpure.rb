cask "linkpure" do
  version "0.6.4"
  sha256 "2e8fd9a9b25759d9a3e72b5949bff5cb30985b35bf6569644492c56f62ae4c8b"

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
    这个 cask 装的是同一款 app 的直发版本，bundle id 与 Mac App Store 版相同
    （com.rxliuli.linkpure2）。两份同时装会互相覆盖，装之前请先卸掉另一份。
  EOS

  zap trash: [
    "~/Library/Containers/com.rxliuli.linkpure2",
    "~/Library/Preferences/com.rxliuli.linkpure2.plist",
    "~/Library/Saved Application State/com.rxliuli.linkpure2.savedState",
  ]
end
