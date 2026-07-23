cask "dispatch" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.4"
  sha256 arm:   "e3b453fda9e87591fb38b8a126bc93c4d6846bd6731270c24dff723bf0666320",
         intel: "63ae3322f9d2d13cc72c5176b0e7a0d0654add9ba1cbf700a81b5ac505440376"

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
