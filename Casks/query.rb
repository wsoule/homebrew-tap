cask "query" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "9a778ab9609a86036236e3dedf76047ea0d29ea89768f400afbbd2a71868cf6c",
         intel: "2a2177b1f4bfe7d37a3bc8ade58c2cb77948268241b834f47687a0547249dd94"

  url "https://github.com/wsoule/Query/releases/download/v#{version}/Query_#{version}_#{arch}.dmg",
      verified: "github.com/wsoule/Query/"
  name "Query"
  desc "Modern SQL database client with git-friendly saved queries"
  homepage "https://github.com/wsoule/Query"

  livecheck do
    url :url
    strategy :github_latest
  end

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
