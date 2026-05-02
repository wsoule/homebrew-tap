class LinearTui < Formula
  desc "Keyboard-first Linear client for the terminal"
  homepage "https://github.com/wsoule/linear-tui"
  url "https://github.com/wsoule/linear-tui.git",
    tag:      "v0.1.2",
    revision: "a51cc7a0872c8950e0bad954ca10c316f81513d8"
  license "MIT"
  head "https://github.com/wsoule/linear-tui.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "oven-sh/bun/bun"

  def install
    system "bun", "install", "--frozen-lockfile", "--production"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/linear-tui"
  end

  def post_install
    puts ""
    puts "linear-tui #{version} installed!"
    puts ""
    puts "Set LINEAR_API_KEY before launching:"
    puts "  export LINEAR_API_KEY=lin_api_..."
    puts ""
    puts "Create a Linear API key:"
    puts "  https://linear.app/settings/account/security"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/linear-tui --version")
    assert_match "LINEAR_API_KEY", shell_output("#{bin}/linear-tui --help")
  end
end
