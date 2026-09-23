class Fuck < Formula
  desc "Fix your last mistyped zsh command using Jev and your history"
  homepage "https://github.com/wsoule/fuck"
  url "https://github.com/wsoule/fuck.git",
    tag:      "v0.2.0",
    revision: "e96f4ba86b463257840117f8973c5c03ce5134de"
  license "MIT"
  head "https://github.com/wsoule/fuck.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "oven-sh/bun/bun"

  def install
    system "bun", "install", "--frozen-lockfile", "--production"
    libexec.install Dir["*"]
    # FUCK_BIN makes `fuck --alias` bake the opt/ path, which survives `brew upgrade`
    (bin/"fuck").write_env_script libexec/"bin/fuck",
      FUCK_BIN: opt_bin/"fuck",
      PATH:     "#{formula_opt_bin("oven-sh/bun/bun")}:$PATH"
  end

  def caveats
    <<~EOS
      Add to ~/.zshrc:
        export TYPESAFE_API_KEY=...
        eval "$(fuck --alias)"

      Without TYPESAFE_API_KEY, fuck falls back to a local best guess.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/fuck --version").strip
    assert_match (opt_bin/"fuck").to_s, shell_output("#{bin}/fuck --alias")
    output = pipe_output("#{bin}/fuck --status 127 2>&1", "ls\0ls -la\0lc\0fuck\0")
    assert_match "ls", output
  end
end
