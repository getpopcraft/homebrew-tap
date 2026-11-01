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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.55.0/popcraft-0.55.0-darwin-arm64.tar.gz"
      sha256 "4ec3bc54ae0de70a1e731800a89911a057b5cc324dc43575b2af9dea0a1c8b69"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.55.0/popcraft-0.55.0-darwin-x64.tar.gz"
      sha256 "3b61601dd13cb310ecb7f0b13316931f10a841a7486ef381a8923005a67554a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.55.0/popcraft-0.55.0-linux-arm64.tar.gz"
      sha256 "9a77574d4575042e56bd07d83742b699c191b6eb5a6d967075e98856542c18e8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.55.0/popcraft-0.55.0-linux-x64.tar.gz"
      sha256 "39f2ef8f5eb1923205d1a631b18974166973eb0ae94a9ac93f284e78e5a4eb70"
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
