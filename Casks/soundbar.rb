cask "soundbar" do
  version "1.2.2"
  sha256 "d79ce614731c66fd3f74804588f2ec358b8c5c6c975125cf83e07ea31954dfd9"

  url "https://statics.fore.studio/soundbar/downloads/SoundBar-#{version}.dmg"
  name "SoundBar"
  desc "Per-app volume mixer in the notch and menu bar"
  homepage "https://soundbarmac.com/"

  livecheck do
    url "https://statics.fore.studio/soundbar/updates/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "SoundBar.app"

  # quit asks through System Events, which a Terminal without Automation access can't; the
  # signal ends it anyway.
  uninstall quit:   "com.forestudio.SoundBar",
            signal: [["TERM", "com.forestudio.SoundBar"]]

  zap trash: [
    "~/Library/Application Support/SoundBar",
    "~/Library/Caches/com.forestudio.SoundBar",
    "~/Library/HTTPStorages/com.forestudio.SoundBar",
    "~/Library/Preferences/com.forestudio.SoundBar.plist",
  ]
end
