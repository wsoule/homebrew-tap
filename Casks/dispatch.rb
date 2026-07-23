cask "dispatch" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.3"
  sha256 arm:   "fe210b98390ff5d38a050646dd96189a0f57707d30a61efc8cbd670d49dfcc12",
         intel: "418a363e5da84ff7f1c29f9969c152c55120c12922bdcafe1292ade652e0d586"

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

  zap trash: [
    "~/Library/Application Support/dev.dispatch.app",
    "~/Library/Caches/dev.dispatch.app",
    "~/Library/Preferences/dev.dispatch.app.plist",
    "~/Library/Saved Application State/dev.dispatch.app.savedState",
    "~/Library/WebKit/dev.dispatch.app",
  ]
end
