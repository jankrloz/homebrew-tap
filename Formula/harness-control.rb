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
    libexec.install Dir["*"]
    (bin/"harness-control").write_env_script libexec/"packages/cli/dist/bin.js", PATH: "#{Formula["node@22"].opt_bin}:/Users/jc/.vite-plus/bin:/var/folders/mf/k0lyn1pd3r7g0c8r70p71mx80000gn/T/agy-plugin-cli-3947890358:/Users/jc/.gemini/antigravity/bin:/Users/jc/Library/Application Support/Antigravity/bin:/Users/jc/.openfang/bin:/Users/jc/.local/bin:/Users/jc/Library/pnpm/bin:/Users/jc/Library/pnpm:/Users/jc/.local/bin:/Users/jc/.kimi-code/bin:/Users/jc/.grok/bin:/Applications/Cursor.app/Contents/Resources/app/bin:/Users/jc/.antigravity/antigravity/bin:/opt/homebrew/opt/fzf/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/mise/bin:/Users/jc/.local/share/mise/installs/aube/latest/.mise-bins:/Users/jc/.local/share/mise/installs/aws-cli/latest/.mise-bins:/Users/jc/.local/share/mise/installs/hk/latest/.mise-bins:/Users/jc/.local/share/mise/installs/lefthook/latest:/Users/jc/.local/share/mise/installs/npm/latest/package/bin:/Users/jc/.local/share/mise/installs/pnpm/latest:/Users/jc/.local/share/mise/installs/node/lts/bin:/Users/jc/.local/share/mise/installs/opentofu/1:/Users/jc/.local/share/mise/installs/python/3.14/bin:/Users/jc/.cargo/bin:/Users/jc/.local/share/mise/installs/task/latest:/Users/jc/.local/share/mise/installs/trivy/0.69.3:/Users/jc/.local/share/mise/installs/usage/latest/.mise-bins:/Users/jc/.local/share/mise/shims:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/pkg/env/global/bin:/Users/jc/.orbstack/bin:/Users/jc/.lmstudio/bin:/Users/jc/.vite-plus/fallback-bin"
    (bin/"harness-controld").write_env_script libexec/"packages/server/dist/daemon.js", PATH: "#{Formula["node@22"].opt_bin}:/Users/jc/.vite-plus/bin:/var/folders/mf/k0lyn1pd3r7g0c8r70p71mx80000gn/T/agy-plugin-cli-3947890358:/Users/jc/.gemini/antigravity/bin:/Users/jc/Library/Application Support/Antigravity/bin:/Users/jc/.openfang/bin:/Users/jc/.local/bin:/Users/jc/Library/pnpm/bin:/Users/jc/Library/pnpm:/Users/jc/.local/bin:/Users/jc/.kimi-code/bin:/Users/jc/.grok/bin:/Applications/Cursor.app/Contents/Resources/app/bin:/Users/jc/.antigravity/antigravity/bin:/opt/homebrew/opt/fzf/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/mise/bin:/Users/jc/.local/share/mise/installs/aube/latest/.mise-bins:/Users/jc/.local/share/mise/installs/aws-cli/latest/.mise-bins:/Users/jc/.local/share/mise/installs/hk/latest/.mise-bins:/Users/jc/.local/share/mise/installs/lefthook/latest:/Users/jc/.local/share/mise/installs/npm/latest/package/bin:/Users/jc/.local/share/mise/installs/pnpm/latest:/Users/jc/.local/share/mise/installs/node/lts/bin:/Users/jc/.local/share/mise/installs/opentofu/1:/Users/jc/.local/share/mise/installs/python/3.14/bin:/Users/jc/.cargo/bin:/Users/jc/.local/share/mise/installs/task/latest:/Users/jc/.local/share/mise/installs/trivy/0.69.3:/Users/jc/.local/share/mise/installs/usage/latest/.mise-bins:/Users/jc/.local/share/mise/shims:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/pkg/env/global/bin:/Users/jc/.orbstack/bin:/Users/jc/.lmstudio/bin:/Users/jc/.vite-plus/fallback-bin"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/harness-control --version")
  end
end
