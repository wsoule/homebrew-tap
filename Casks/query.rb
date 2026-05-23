cask "query" do
  version "0.1.0-local.1"
  sha256 "849036a6042417dee386e7193135d9d686ae513f8996adaeeaaaedaa093f4b39"

  url "https://github.com/wsoule/Query/releases/download/v#{version}/Query_0.1.0_x64.dmg"
  name "Query"
  desc "Modern SQL database client with git-friendly saved queries"
  homepage "https://github.com/wsoule/Query"

  livecheck do
    skip "Temporary local x64 release"
  end

  depends_on arch: :x86_64
  depends_on macos: :monterey

  app "Query.app"

  zap trash: [
    "~/.query",
    "~/Library/Application Support/dev.querydb.query",
    "~/Library/Caches/dev.querydb.query",
    "~/Library/HTTPStorages/dev.querydb.query",
    "~/Library/Preferences/dev.querydb.query.plist",
    "~/Library/Saved Application State/dev.querydb.query.savedState",
    "~/Library/WebKit/dev.querydb.query",
  ]
end
