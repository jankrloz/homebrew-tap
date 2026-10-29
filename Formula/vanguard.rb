class Vanguard < Formula
  desc "Interactive vulnerability shield & package update orchestrator"
  homepage "https://github.com/jankrloz/vanguard"
  version "0.1.2"
  license "MIT"

  depends_on "meta-package-manager"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jankrloz/vanguard/releases/download/v0.1.2/vanguard_0.1.2_darwin_arm64.tar.gz"
      sha256 "d421f27acd9f7cc4774135269be6e1ed6b5396b19c6085ec8308d63b8a130d6c"
    else
      url "https://github.com/jankrloz/vanguard/releases/download/v0.1.2/vanguard_0.1.2_darwin_amd64.tar.gz"
      sha256 "87934398f1aa56f477febb6d0a4cdc2a0a3df3a5192f344009df557c9fe0e81f"
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
