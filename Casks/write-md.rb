cask "write-md" do
  version "1.1.1"
  sha256 "f1bd430e4c15e5ebc8a3a6b219c060eb784d3987faaf6dcf40777d035cf4b20d"

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
