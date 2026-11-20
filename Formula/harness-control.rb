class HarnessControl < Formula
  desc "Unified AI coding harness control plane (CLI, TUI, daemon)"
  homepage "https://github.com/jankrloz/harness-control"
  url "https://github.com/jankrloz/harness-control/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "4437106aa7d21105cd17fe5bff1ecceb329a883e566c8329528afc214c236b98"
  license "MIT"

  depends_on "node@22"
  depends_on "pnpm"

  def install
    system "pnpm", "install", "--frozen-lockfile"
    system "pnpm", "-r", "--filter", "!@harness-control/desktop", "build"
    rm_rf "node_modules"
    rm_rf "apps/web/node_modules"
    rm_rf "apps/desktop"
    system "pnpm", "install", "--prod", "--frozen-lockfile", "--filter", "@harness-control/cli..."
    libexec.install Dir["*"]
    (bin/"harness-control").write_env_script libexec/"packages/cli/dist/bin.js", PATH: "#{Formula["node@22"].opt_bin}:$PATH"
    (bin/"harness-controld").write_env_script libexec/"packages/server/dist/daemon.js", PATH: "#{Formula["node@22"].opt_bin}:$PATH"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/harness-control --version")
  end
end
