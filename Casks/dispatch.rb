cask "dispatch" do
  arch arm: "aarch64", intel: "x64"

  version "0.47.0"
  sha256 arm:   "79f2b0dfbad18372a8a0f2636622c1e1fca4205dc3155495ae51c6ef6419dbf1",
         intel: "a3557534e0fddb18158cc7ba278fc8a2ec4c91c0fe94846bea1a6c20ab3ae7ac"

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
