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
      sha256 "a3e3e485337b0428be01317a0c2a36562a77b54144568694c73720b58a539879"
    else
      url "https://github.com/jankrloz/vanguard/releases/download/v0.5.0/vanguard_0.5.0_darwin_amd64.tar.gz"
      sha256 "507b254792c8f23b9c90596eb62bab203768affc8b6ee812fd26fb3ee7375f78"
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
