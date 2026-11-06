cask "dispatch" do
  arch arm: "aarch64", intel: "x64"

  version "0.53.0"
  sha256 arm:   "c4ca0f0f53103aaffbbd4237b233e9c4c5f261f7a998cdbd31b824cd60569ffd",
         intel: "7d87bfd68701504cb14d4a8218912a8e28a51aa3e887a66a716f0084e1273c17"

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
