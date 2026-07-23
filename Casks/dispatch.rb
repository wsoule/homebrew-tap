cask "dispatch" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "d71ead000ceb6b8e65d66124e338ee19007d7b7b43b73e37c49f6bb5ffe6010f",
         intel: "4b519c0342d013bb5e997470807789af9ef6674d7dc1a253fe2c3a2d5e2047c5"

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
