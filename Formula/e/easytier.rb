class Easytier < Formula
  desc "Simple, decentralized mesh VPN with WireGuard support"
  homepage "https://easytier.cn"
  url "https://github.com/EasyTier/EasyTier/archive/refs/tags/v2.4.2.tar.gz"
  sha256 "5b1a33b55103e30c3762b6cbcc390a55f4a1a588b2e1cc6c3a687cb2195df7bc"
  license "LGPL-3.0-only"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/easytier-cli --version")
  end
end
