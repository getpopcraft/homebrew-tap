# typed: false
# frozen_string_literal: true

# The `popcraft` command line: one executable with the design kit inside (compiled with bun), no Node needed.
# npm has the same CLI as @popcraft/cli. Written by .github/workflows/update-formulas.yml; don't edit by hand.
class Popcraft < Formula
  desc "Command-line for PopCraft: edit .popcraft files, call the API, publish plugins"
  homepage "https://popcraft.app/docs/api/cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.54.0/popcraft-0.54.0-darwin-arm64.tar.gz"
      sha256 "32202cee991358f42a8b116b6b9033d488386920f3dd9334220aacc7796022f0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.54.0/popcraft-0.54.0-darwin-x64.tar.gz"
      sha256 "6362dc9735b18b417290f3c5f9189c2247459ff52131eacb4f5afb4655515c06"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.54.0/popcraft-0.54.0-linux-arm64.tar.gz"
      sha256 "dc6795e54a34715c25603a1b72d2d4a7ab80a4de9909f8e5947ba297c669392b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.54.0/popcraft-0.54.0-linux-x64.tar.gz"
      sha256 "c55c43a4137b1bab4134919bdf64b504d8ca105b976efbcbc731df27fbd46ccd"
    end
  end

  def install
    bin.install "popcraft"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/popcraft --version").strip
    system bin/"popcraft", "new", testpath/"t.popcraft", "--name", "Test"
    assert_path_exists testpath/"t.popcraft"
  end
end
