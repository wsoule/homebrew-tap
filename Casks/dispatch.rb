cask "dispatch" do
  arch arm: "aarch64", intel: "x64"

  version "0.54.0"
  sha256 arm:   "8ce84f7dc937851ff560a4c6c34f16c459cca899e713e2694ec879e2465c9b7b",
         intel: "5a75bbe59a558f1aa9e7ddfda8fbd1096f37426a4d7ee04ab0a2f078fe75117d"

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
