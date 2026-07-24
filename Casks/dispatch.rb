cask "dispatch" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.1"
  sha256 arm:   "5312781abdb7a9c2369c6c8e106b44c7073f47e6f3856f4b92b0bcb6aa283d5e",
         intel: "94da048fe77224b1f7bc18b2e8dc8e96c0e587a986166b28a471d3e5e955b8e8"

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
