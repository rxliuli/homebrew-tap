cask "linkpure" do
  version "0.6.5"
  sha256 "0a74093b98242c49fe866a9f5cc7d96e627c0028fcd087bc7a35e03adc080f3f"

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
