cask "vitals" do
  version "1.8.5"
  sha256 "a375782f024f708809e55d65fa0840810fdc741a7edfe102348ffa47c4ce03ec"

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
  # signal ends it anyway.
  uninstall launchctl: "com.forestudio.Vitals.helper",
            quit:      "com.forestudio.Vitals",
            signal:    [["TERM", "com.forestudio.Vitals"]]

  zap trash: [
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
