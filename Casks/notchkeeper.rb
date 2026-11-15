cask "notchkeeper" do
  version "0.2.0"
  sha256 "9246c2df5a3dd8346724d4b6b3c208233ff36e2010c2f224a27ff55651f93508"

  url "https://github.com/thevahidal/notchkeeper/releases/download/v#{version}/Notchkeeper.zip"
  name "Notchkeeper"
  desc "Claude Code agents in the MacBook notch: live status, safer approvals, replies"
  homepage "https://thevahidal.github.io/notchkeeper/"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Notchkeeper.app"

  uninstall quit:   "io.github.thevahidal.notchkeeper",
            script: {
              executable: "#{appdir}/Notchkeeper.app/Contents/MacOS/Notchkeeper",
              args:       ["--disconnect"],
            }

  zap trash: "~/.notchkeeper"

  caveats <<~EOS
    The first time you open Notchkeeper, macOS asks you to allow it once:
      System Settings > Privacy & Security > "Open Anyway" next to Notchkeeper.

    Then Notchkeeper asks, in the notch, before connecting to Claude Code.
    Coming from Ping? It offers to swap Ping's hooks for its own.
  EOS
end
