cask "write" do
  version "1.0"
  sha256 "3dd7648f267f9541f8d83e9567e8a999887689481c88c1532078205a815b48a4"

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

  caveats <<~EOS
    Write is signed but not yet notarized. If macOS refuses to open it,
    right-click Write.app in /Applications and choose Open once, or install with:
      brew install --cask --no-quarantine wsoule/tap/write
  EOS
end
