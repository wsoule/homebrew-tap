cask "dispatch" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.2"
  sha256 arm:   "348d1e578ab86426e5b9837df287c0b96521e5ecf0da6847eca18ddcdec0f076",
         intel: "88042b005f1161ff4eb8232e5375bce4ed213cfde40459bda1c1e6660f9a4f5d"

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
