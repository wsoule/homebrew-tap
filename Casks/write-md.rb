cask "write-md" do
  version "1.1.2"
  sha256 "f3e3ecaf2c843043c4b2b1417ab6c62843169b1cb1b186f48abcf0962b7b813b"

  url "https://github.com/wsoule/Write/releases/download/v#{version}/Write-#{version}.zip"
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
