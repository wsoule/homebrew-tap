cask "dispatch" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "c7d12f6fd3dd2d84ce29bb979aaa46a887ad14d71ebdcda3ad43aa7378ce1951",
         intel: "9abf5f101669fe8d0ca5e8ac9790952eebf9cbb5d4f4d9aab79031fb58be49c0"

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
