cask "dispatch" do
  arch arm: "aarch64", intel: "x64"

  version "0.23.2"
  sha256 arm:   "989ade2be38267fd91fc44784131cc2edc85f6673c4a7ff378ac15e77f860ae9",
         intel: "63f384566c22b79e46898e0c9c02f23dd8e41bf1b10f228232e4132d13876928"

  url "https://github.com/wsoule/dispatch/releases/download/v#{version}/Dispatch_#{version}_#{arch}.dmg",
      verified: "github.com/wsoule/dispatch/"
  name "Dispatch"
  desc "Git-native task tracking and AI-agent orchestration desktop app"
  homepage "https://github.com/wsoule/dispatch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

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
