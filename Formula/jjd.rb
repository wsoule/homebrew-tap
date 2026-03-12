class Jjd < Formula
  desc "Jujutsu automation daemon — auto-describe, bookmark, and push with AI"
  homepage "https://github.com/wsoule/jjd"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wsoule/jjd/releases/download/v#{version}/jjd-darwin-arm64.tar.gz"
      sha256 "3baf01f3eda949bc65f6a51454a925bc0eea428b922ba8b3a34f8e5f1f5bab0e"
    else
      url "https://github.com/wsoule/jjd/releases/download/v#{version}/jjd-darwin-x64.tar.gz"
      sha256 "e2374dec08baca2cbbeef3a17f9cb3132fc6095b92d9b00e582f3af0981d96bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wsoule/jjd/releases/download/v#{version}/jjd-linux-arm64.tar.gz"
      sha256 "8c8196581f1274d62a5ce6a5279fdbfc0fb58ede5421cd85939ffb54862283a1"
    else
      url "https://github.com/wsoule/jjd/releases/download/v#{version}/jjd-linux-x64.tar.gz"
      sha256 "74ec1d3af32117d6c24223e6e85065e8a964697d25fa5edb951401147ab815e6"
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
