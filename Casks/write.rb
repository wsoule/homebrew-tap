cask "write" do
  version "1.1"
  sha256 "b65043be75409b246001cdc3e9440d801cd02acf542b60f9b6763a3b400813e0"

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
