class Vanguard < Formula
  desc "Interactive vulnerability shield & package update orchestrator"
  homepage "https://jankrloz.github.io/vanguard/"
  version "0.5.0"
  license "MIT"

  depends_on "meta-package-manager"
  depends_on "osv-scanner"
  depends_on "trivy"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jankrloz/vanguard/releases/download/v0.5.0/vanguard_0.5.0_darwin_arm64.tar.gz"
      sha256 "f64c3677522d536304bde27f0f25a0eb0f7db1576d6e4c42de73c8da33b7e2ca"
    else
      url "https://github.com/jankrloz/vanguard/releases/download/v0.5.0/vanguard_0.5.0_darwin_amd64.tar.gz"
      sha256 "2a3c66f8f5e6cb4be2a0ca506d92cbd4a70e3edb06fb730f3e9a97d65bea1e52"
    end
  end

  def install
    bin.install "vanguard"
    bin.install_symlink "vanguard" => "vg"
    bin.install_symlink "vanguard" => "up"
  end

  test do
    assert_match "Vanguard", shell_output("#{bin}/vanguard --help 2>&1", 2)
  end
end
