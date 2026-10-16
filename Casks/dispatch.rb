cask "dispatch" do
  arch arm: "aarch64", intel: "x64"

  version "0.46.0"
  sha256 arm:   "0e70782cf50afd10b3291a67bf7029eec7f46a5b7ee85a5878b56bee47649122",
         intel: "d5797b123eb3ad7a40340c7c8ad0ac81338b2da92142865ddd4db416a5aa78d5"

  url "https://github.com/wsoule/dispatch/releases/download/v#{version}/Dispatch_#{version}_#{arch}.dmg"
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
