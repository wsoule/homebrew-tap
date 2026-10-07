cask "dispatch" do
  arch arm: "aarch64", intel: "x64"

  version "0.40.2"
  sha256 arm:   "8d1ee1df4f9f02bcd2079e914120bafacde48325921c6ed877bc3041a058f7b3",
         intel: "134cd79357cb9c97e9fde489157ff1c3c96548991b18b0ac3f6d343c1ea0344f"

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
