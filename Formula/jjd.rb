class Jjd < Formula
  desc "Jujutsu automation daemon — auto-describe, bookmark, and push with AI"
  homepage "https://github.com/wsoule/jjd"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wsoule/jjd/releases/download/v#{version}/jjd-darwin-arm64.tar.gz"
      sha256 "7ba80c14795a6af2b98368cbdb329434fdaa8420f36662cef410a290c526fd08"
    else
      url "https://github.com/wsoule/jjd/releases/download/v#{version}/jjd-darwin-x64.tar.gz"
      sha256 "029cf9174dedd79f84bc53d6f4ad01bc04fe6c6a82ab470878ab92139149d988"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wsoule/jjd/releases/download/v#{version}/jjd-linux-arm64.tar.gz"
      sha256 "184c35681135dc0a6aebbc35de340c260a6a71a7681184c171bc6da940649479"
    else
      url "https://github.com/wsoule/jjd/releases/download/v#{version}/jjd-linux-x64.tar.gz"
      sha256 "0e0c7432719d627e72c521d2583d1a150c733b2bc8a48eabb62e492bd6d083d9"
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
