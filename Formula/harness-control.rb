class HarnessControl < Formula
  desc "Unified AI coding harness control plane (CLI, TUI, daemon)"
  homepage "https://github.com/jankrloz/harness-control"
  url "https://github.com/jankrloz/harness-control/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "f4f4447bdfc14beaae674cd370696350a90ec3a0850b4b5f79714e808b8e8931"
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
    chmod 0755, libexec/"packages/cli/dist/bin.js"
    chmod 0755, libexec/"packages/server/dist/daemon.js"
    (bin/"harness-control").write_env_script libexec/"packages/cli/dist/bin.js", PATH: "#{Formula["node@22"].opt_bin}:$PATH"
    (bin/"harness-controld").write_env_script libexec/"packages/server/dist/daemon.js", PATH: "#{Formula["node@22"].opt_bin}:$PATH"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/harness-control --version")
  end
end
