cask "write" do
  version "1.0"
  sha256 "4eec08d948a537000861a574fd20c7f523ab3fe3c53d1eb91b57433b324b8d2a"

  url "https://github.com/wsoule/Write/releases/download/v#{version}/Write-#{version}.zip",
      verified: "github.com/wsoule/Write/"
  name "Write"
  desc "Dead-simple Markdown writing app: one window, one column of text"
  homepage "https://github.com/wsoule/Write"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Write.app"

  zap trash: [
    "~/Library/Preferences/com.wsoule.Write.plist",
    "~/Library/Saved Application State/com.wsoule.Write.savedState",
  ]

end
