cask "soundbar" do
  version "1.0.7"
  sha256 "548c2f84f7716c10c5295812a3d9f4832f90f9c79236b5ab25b29705bf0b46b4"

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
