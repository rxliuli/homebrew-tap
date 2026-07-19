cask "imp-rec" do
  version "0.0.25"
  sha256 "f7776f057b0593b763c29028027d4691ad887d1f936e95840e1ba0180b1af2aa"

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
