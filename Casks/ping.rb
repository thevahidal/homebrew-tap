cask "ping" do
  version "0.1.0"
  sha256 "e021c896b21627c4388c15848426c2804d7ab456128ca4f395fe2aee5b6dfcac"

  url "https://github.com/thevahidal/ping/releases/download/v#{version}/Ping.zip"
  name "Ping"
  desc "Claude Code agents in the MacBook notch: live status, approvals and replies"
  homepage "https://github.com/thevahidal/ping"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Ping.app"

  uninstall quit:   "io.github.thevahidal.ping",
            script: {
              executable: "#{appdir}/Ping.app/Contents/MacOS/Ping",
              args:       ["--disconnect"],
            }

  zap trash: "~/.ping"

  caveats <<~EOS
    Ping isn't signed with an Apple Developer ID yet. The first time you open it,
    macOS says it can't verify the developer. To allow it:
      System Settings > Privacy & Security > "Open Anyway" next to Ping.

    On first launch Ping asks, in the notch, before connecting to Claude Code.
  EOS
end
