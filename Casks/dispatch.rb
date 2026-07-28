cask "dispatch" do
  arch arm: "aarch64", intel: "x64"

  version "0.9.1"
  sha256 arm:   "760c3eb1e46b3b3210988f926c081796cb11fbbb65e4b8861b20e525bb12fc2b",
         intel: "b2a319c949860b5dc405a44e3b0d575186e586ed6be16351123459795438f8ea"

  url "https://github.com/wsoule/dispatch/releases/download/v#{version}/Dispatch_#{version}_#{arch}.dmg",
      verified: "github.com/wsoule/dispatch/"
  name "Dispatch"
  desc "Git-native task tracking and AI-agent orchestration desktop app"
  homepage "https://github.com/wsoule/dispatch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Dispatch.app"
  binary "#{appdir}/Dispatch.app/Contents/Resources/resources/dispatch-cli", target: "dispatch"

  zap trash: [
    "~/Library/Application Support/dev.dispatch.app",
    "~/Library/Caches/dev.dispatch.app",
    "~/Library/Preferences/dev.dispatch.app.plist",
    "~/Library/Saved Application State/dev.dispatch.app.savedState",
    "~/Library/WebKit/dev.dispatch.app",
  ]
end
