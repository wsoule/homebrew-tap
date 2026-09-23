cask "dispatch" do
  arch arm: "aarch64", intel: "x64"

  version "0.35.1"
  sha256 arm:   "6457cc1922452ccaf8585fdecebaa21b7af29f9a3802ad28c6bfb18320359887",
         intel: "8be995e8f3ce3156ff618234153017f0869cab55445eb948774df12efd58b8ce"

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
