class Dotfiles < Formula
  desc "Modern dotfiles manager with Homebrew and GNU Stow integration"
  homepage "https://github.com/wsoule/new-dotfiles"
  url "https://github.com/wsoule/new-dotfiles/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "f65bce1aac0ddf6a614cccd9bbdf2aa8d4f4066ae8108769c0e6b2bab3d075f5"
  license "MIT"
  head "https://github.com/wsoule/new-dotfiles.git", branch: "main"

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

