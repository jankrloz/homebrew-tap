class Vanguard < Formula
  desc "Interactive vulnerability shield & package update orchestrator"
  homepage "https://github.com/jankrloz/vanguard"
  version "0.1.1"
  license "MIT"

  depends_on "meta-package-manager"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jankrloz/vanguard/releases/download/v0.1.1/vanguard_0.1.1_darwin_arm64.tar.gz"
      sha256 "df2fdf07917d408ed7c062560dce69095b1543d1e87db781597fdc2d25bbb431"
    else
      url "https://github.com/jankrloz/vanguard/releases/download/v0.1.1/vanguard_0.1.1_darwin_amd64.tar.gz"
      sha256 "cd9a6486827e4fd32eafde706792c7950cb06809352d4d0929c22db86c951ab0"
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
