cask "vitals" do
  version "1.8.15"
  sha256 "ad3bdf5950f2ab5201a3ee2d926e567af8c41b3005e39997bad3b3451ab1c1e5"

  url "https://statics.fore.studio/vitals/downloads/Vitals-#{version}.dmg"
  name "Vitals"
  desc "Activity Monitor alternative that shows apps instead of processes"
  homepage "https://vitalsmac.com/"

  livecheck do
    url "https://statics.fore.studio/vitals/updates/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Vitals.app"
  # The command asks the running app, so it comes with the app and is linked from inside it.
  binary "#{appdir}/Vitals.app/Contents/Helpers/vitals"
  manpage "#{appdir}/Vitals.app/Contents/Resources/vitals.1"
  bash_completion "#{appdir}/Vitals.app/Contents/Resources/vitals.bash"
  zsh_completion "#{appdir}/Vitals.app/Contents/Resources/_vitals"
  fish_completion "#{appdir}/Vitals.app/Contents/Resources/vitals.fish"

  # quit asks through System Events, which a Terminal without Automation access can't; the
  # signal ends it anyway. The helper is not unloaded here: uninstall runs on every upgrade
  # too, and macOS kept the helper's registration as on while nothing ran it.
  uninstall quit:   "com.forestudio.Vitals",
            signal: [["TERM", "com.forestudio.Vitals"]]

  zap launchctl: "com.forestudio.Vitals.helper",
      trash:     [
        "~/Library/Application Support/Vitals",
        "~/Library/Caches/com.forestudio.Vitals",
        "~/Library/HTTPStorages/com.forestudio.Vitals",
        "~/Library/Preferences/com.forestudio.Vitals.plist",
        "~/Library/Saved Application State/com.forestudio.Vitals.savedState",
      ]

  caveats <<~EOS
    vitals answers from the running app. Open Vitals, then turn on
    Settings → Integrations → Let AI Assistants Ask Vitals.
  EOS
end
