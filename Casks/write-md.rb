cask "write-md" do
  version "1.2.0"
  sha256 "f62ebfc0111efff4ad34ae2ba14ddf65f7a7d6d415d804745f845f8023aba7f6"

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
