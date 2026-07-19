cask "imp-rec" do
  version "0.0.24"
  sha256 "c8328eed3f6a63b6d8be370e3282f3f8b8e14c0c76b2ff7669d55ce9b7a59306"

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
