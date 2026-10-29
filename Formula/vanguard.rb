class Vanguard < Formula
  desc "Interactive vulnerability shield & package update orchestrator"
  homepage "https://jankrloz.github.io/vanguard/"
  version "0.2.0"
  license "MIT"

  depends_on "meta-package-manager"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jankrloz/vanguard/releases/download/v0.2.0/vanguard_0.2.0_darwin_arm64.tar.gz"
      sha256 "44ebda5810d7eb9d50a79d52c66734ced6180f08e4ea39843ddb8be75dedc7d9"
    else
      url "https://github.com/jankrloz/vanguard/releases/download/v0.2.0/vanguard_0.2.0_darwin_amd64.tar.gz"
      sha256 "a7978a11fb65911089303d923c042111692121aa7bde777be8bd65aeae3362aa"
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
