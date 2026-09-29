class Kodex < Formula
  desc "Local coding agent"
  homepage "https://github.com/dsvolk/kodex"
  version "0.156.0"
  license "Apache-2.0"
  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/dsvolk/kodex/releases/download/v0.156.0/kodex-v0.156.0-aarch64-apple-darwin.tar.gz"
  sha256 "3f6a65ec046129dd56c18313312e699d52fb778421836e70e310cd390405baff"

  def install
    prefix.install "kodex-package.json", "kodex-path", "kodex-resources"
    bin.install "bin/kodex", "bin/kodex-code-mode-host"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodex --version")
    assert_predicate bin/"kodex-code-mode-host", :executable?
    assert_predicate prefix/"kodex-path/rg", :executable?
    assert_path_exists prefix/"kodex-package.json"
  end
end
