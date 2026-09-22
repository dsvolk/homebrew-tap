class Kodex < Formula
  desc "Local coding agent"
  homepage "https://github.com/dsvolk/kodex"
  version "0.1.2"
  license "Apache-2.0"
  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/dsvolk/kodex/releases/download/v0.1.2/kodex-v0.1.2-aarch64-apple-darwin.tar.gz"
  sha256 "c9995a16f5a327790b185124bf40c5ec9180fbfbd58c1dfcecba25ed22176a11"

  def install
    bin.install "kodex"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodex --version")
  end
end
