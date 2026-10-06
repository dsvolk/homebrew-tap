class Kodex < Formula
  desc "Local coding agent"
  homepage "https://github.com/dsvolk/kodex"
  version "0.160.1"
  license "Apache-2.0"
  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/dsvolk/kodex/releases/download/v0.160.1/kodex-v0.160.1-aarch64-apple-darwin.tar.gz"
  sha256 "8a9bc1fc5cbe7aafd0cd181f4fdfbf84782e7529e98dc2a97d197b6435570997"

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
