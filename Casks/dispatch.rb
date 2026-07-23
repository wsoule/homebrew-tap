cask "dispatch" do
  version "0.1.0"

  on_arm do
    sha256 "2c84d2a3f49a7d39ba5500c2d24d7ceff7c85037c76bb7a46afe99e4c5f4b599"

    url "https://github.com/wsoule/dispatch/releases/download/v#{version}/Dispatch_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "a8aa3b9b0e19487a272a708eed3894c700b6add626388bbe7335516c432c5e50"

    url "https://github.com/wsoule/dispatch/releases/download/v#{version}/Dispatch_#{version}_x64.dmg"
  end

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

  caveats <<~EOS
    Dispatch is not code-signed or notarized yet. If macOS blocks the first
    launch, either right-click the app and choose Open, or install with:
      brew install --cask --no-quarantine dispatch
  EOS
end
