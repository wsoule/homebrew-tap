cask "write-md" do
  version "1.2.1"
  sha256 "5c4ad055eba2b75bdba2f5cac42f82fce8634916637f2ec0908c3cf33d89bf00"

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
