cask "dispatch" do
  arch arm: "aarch64", intel: "x64"

  version "0.32.0"
  sha256 arm:   "54725072971e925c65b15bdb1afcbc706a5ec9867cf2286232f85784721503a7",
         intel: "80c4c3a219ddcdf515f2b966dc1f59d68a582f92f64a61013ef682a1f393db40"

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
