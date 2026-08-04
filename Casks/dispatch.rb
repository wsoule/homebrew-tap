cask "dispatch" do
  arch arm: "aarch64", intel: "x64"

  version "0.16.1"
  sha256 arm:   "7961ed92b3ef9898a70889d1416b8bb92c1143288d2bc5892813e6077e63e0a7",
         intel: "b72296f84be1ccfe6cfccdb3d84256d5f8d4a6d0b3bab4a76a7e72cd54370eb3"

  url "https://github.com/wsoule/dispatch/releases/download/v#{version}/Dispatch_#{version}_#{arch}.dmg",
      verified: "github.com/wsoule/dispatch/"
  name "Dispatch"
  desc "Git-native task tracking and AI-agent orchestration desktop app"
  homepage "https://github.com/wsoule/dispatch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

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
