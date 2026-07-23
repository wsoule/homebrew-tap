cask "dispatch" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "d9f81aedfad52c0988fcae5d228a6befd3484b73539d4f85e0fbcd81b51d15fc",
         intel: "9ee8193f699a1d472d358800e95949450f7aa031d6bd9a2d8d9e6016a9918d5a"

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
