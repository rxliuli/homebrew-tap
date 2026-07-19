cask "imp-rec" do
  version "0.0.22"
  sha256 "7e9bc1ad8860c60f23ed076069ed3948d2ec79f39b6e9a86fa74bb424004d178"

  url "https://github.com/rxliuli/imp-rec/releases/download/v#{version}/ImpRec-macos.dmg"
  name "ImpRec"
  desc "Lightweight, open-source screen recorder"
  homepage "https://github.com/rxliuli/imp-rec"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "ImpRec.app"

  zap trash: [
    "~/Library/Preferences/com.rxliuli.imp-rec.plist",
    "~/Library/Saved Application State/com.rxliuli.imp-rec.savedState",
  ]
end
