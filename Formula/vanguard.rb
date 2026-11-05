class Vanguard < Formula
  desc "Interactive vulnerability shield & package update orchestrator"
  homepage "https://jankrloz.github.io/vanguard/"
  version "0.4.0"
  license "MIT"

  depends_on "meta-package-manager"
  depends_on "osv-scanner"
  depends_on "trivy"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jankrloz/vanguard/releases/download/v0.4.0/vanguard_0.4.0_darwin_arm64.tar.gz"
      sha256 "bb865ad99ca6a35c4b8d6361f6eed1732390f816573c10eb21b0fc9c84276402"
    else
      url "https://github.com/jankrloz/vanguard/releases/download/v0.4.0/vanguard_0.4.0_darwin_amd64.tar.gz"
      sha256 "bd47d3b21735675c90124843e59da8b3f762858b573e4a2b88110186494cecad"
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
