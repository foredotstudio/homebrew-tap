cask "vitals" do
  version "1.8.0"
  sha256 "cc037c345ee5e602a76b3883256003bbcdb718e89b905a612aeffeb3ee2f75b3"

  url "https://statics.fore.studio/vitals/downloads/Vitals-#{version}.dmg"
  name "Vitals"
  desc "Activity Monitor alternative that shows apps instead of processes"
  homepage "https://vitalsmac.com/"

  livecheck do
    url "https://statics.fore.studio/vitals/updates/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sequoia"

  app "Vitals.app"
  # The command asks the running app, so it comes with the app and is linked from inside it.
  binary "#{appdir}/Vitals.app/Contents/Helpers/vitals"
  manpage "#{appdir}/Vitals.app/Contents/Resources/vitals.1"
  bash_completion "#{appdir}/Vitals.app/Contents/Resources/vitals.bash"
  fish_completion "#{appdir}/Vitals.app/Contents/Resources/vitals.fish"
  zsh_completion "#{appdir}/Vitals.app/Contents/Resources/_vitals"

  uninstall launchctl: "com.forestudio.Vitals.helper",
            quit:      "com.forestudio.Vitals"

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
