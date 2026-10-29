class Vanguard < Formula
  desc "Interactive vulnerability shield & package update orchestrator"
  homepage "https://github.com/jankrloz/vanguard"
  version "0.1.0"
  license "MIT"

  depends_on "meta-package-manager"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jankrloz/vanguard/releases/download/v0.1.0/vanguard_0.1.0_darwin_arm64.tar.gz"
      sha256 "8a5cbc2169343086d72e80dc1f76953b7413d8d0b979997e29b25dfc6711fc4e"
    else
      url "https://github.com/jankrloz/vanguard/releases/download/v0.1.0/vanguard_0.1.0_darwin_amd64.tar.gz"
      sha256 "11e1183b3232734ba1231145fe9abd7ed5787358be077c4586ebdd918cc98f85"
    end
  end

  def install
    bin.install "vanguard"
    bin.install_symlink "vanguard" => "vg"
  end

  test do
    assert_match "Vanguard", shell_output("#{bin}/vanguard --help 2>&1", 2)
  end
end
