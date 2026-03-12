class Jjd < Formula
  desc "Jujutsu automation daemon — auto-describe, bookmark, and push with AI"
  homepage "https://github.com/wsoule/jjd"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wsoule/jjd/releases/download/v#{version}/jjd-darwin-arm64.tar.gz"
      sha256 "dfdb4caceed787167a42cea28c307d5f870dd7aa6b99416e31782c15ab8b4369"
    else
      url "https://github.com/wsoule/jjd/releases/download/v#{version}/jjd-darwin-x64.tar.gz"
      sha256 "4e3926c3b541fe2429be3587f10c3a2e8bf8492429634fd60212834c8c5f92e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wsoule/jjd/releases/download/v#{version}/jjd-linux-arm64.tar.gz"
      sha256 "8feb8d6fcc8dc04e60543513bd1bc9a5057b06499382f9335c02e3a9d101e40b"
    else
      url "https://github.com/wsoule/jjd/releases/download/v#{version}/jjd-linux-x64.tar.gz"
      sha256 "a7e4f1dce6c9d428242e54bf0fda1cd916ed892df2439be8fad2fdab9b9702e8"
    end
  end

  depends_on "jj"

  def install
    bin.install "jjd"
  end

  def post_install
    puts ""
    puts "jjd #{version} installed!"
    puts ""
    puts "Get started:"
    puts "  cd your-jj-repo"
    puts "  export ANTHROPIC_API_KEY=sk-ant-..."
    puts "  jjd init                             # one-time repo setup"
    puts ""
    puts "Then start coding:"
    puts "  jjd session start ENG-123 --claude   # with a Linear task"
    puts "  jjd session start my-feature --claude # without Linear"
    puts ""
    puts "Or use Claude Code's native /worktree — jjd starts automatically."
    puts ""
    puts "Docs: https://github.com/wsoule/jjd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jjd --version")
    assert_match "Usage", shell_output("#{bin}/jjd help")
  end

  livecheck do
    url :stable
    strategy :github_latest
  end
end
