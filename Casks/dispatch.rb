cask "dispatch" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "59c105a5e0a17fb6ce528f529f29447b1b055b7387044dc6263698b3fedf5cd6",
         intel: "353aac543c0ae2cd21b36f360ac077592338b8b95aaf1c1b662891c22262f1cd"

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
