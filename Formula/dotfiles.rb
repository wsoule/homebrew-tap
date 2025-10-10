class Dotfiles < Formula
  desc "Modern dotfiles manager with Homebrew and GNU Stow integration"
  homepage "https://github.com/wsoule/dotfiles-cli"
  url "https://github.com/wsoule/dotfiles-cli/archive/refs/tags/v2.3.1.tar.gz"
  sha256 "d106ecf8449cba96fbd663ce244abaa4a42739979d1080723cf5a10fecb9ea5d"
  license "MIT"
  head "https://github.com/wsoule/dotfiles-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"dotfiles", ldflags: "-s -w")
  end

  def post_install
    puts ""
    puts "🎉 Dotfiles Manager installed successfully!"
    puts ""
    puts "Get started with:"
    puts "  dotfiles onboard          # Complete developer setup"
    puts "  dotfiles init             # Initialize configuration"
    puts "  dotfiles github setup     # Set up GitHub SSH"
    puts ""
    puts "For help: dotfiles --help"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dotfiles --version")
    system "#{bin}/dotfiles", "--help"
  end

  livecheck do
    url :stable
    strategy :github_latest
  end
end

