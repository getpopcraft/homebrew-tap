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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.55.1/popcraft-0.55.1-darwin-arm64.tar.gz"
      sha256 "878976d8f1f63255a09b2819549659c513dc802ebe44adb8d7f56f45af129803"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.55.1/popcraft-0.55.1-darwin-x64.tar.gz"
      sha256 "9c721d4cacfdd077874e52d16d1495bf8ee3726880b19e2a14b40c75a88240d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.55.1/popcraft-0.55.1-linux-arm64.tar.gz"
      sha256 "4c9753f850967f563c96090e326e7faf304989cce631d41035e1b65247fa2441"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.55.1/popcraft-0.55.1-linux-x64.tar.gz"
      sha256 "804b72087c4905163648a5ccabdebae420ad6c4b12aed7b28475adc1fe779404"
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
