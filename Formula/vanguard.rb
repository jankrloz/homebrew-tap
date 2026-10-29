class Vanguard < Formula
  desc "Interactive vulnerability shield & package update orchestrator"
  homepage "https://jankrloz.github.io/vanguard/"
  version "0.3.0"
  license "MIT"

  depends_on "meta-package-manager"
  depends_on "osv-scanner"
  depends_on "trivy"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jankrloz/vanguard/releases/download/v0.3.0/vanguard_0.3.0_darwin_arm64.tar.gz"
      sha256 "a84eddb6d698324a966e0a61792aebda9d7c726dfdecec57aa9f115b32173521"
    else
      url "https://github.com/jankrloz/vanguard/releases/download/v0.3.0/vanguard_0.3.0_darwin_amd64.tar.gz"
      sha256 "d6c239c2722a2c082b51c82d8f2f36d580183ce7997e5e83eb0b9c25fc0fdcfc"
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
