cask "levers" do
  version "1.0.3"
  sha256 "21a2f2c5b755abd52472a6b246161732a3b525550ad365d295d4b518a36245f2"

  url "https://statics.fore.studio/levers/downloads/Levers-#{version}.dmg"
  name "Levers"
  desc "Menu bar app that clears the desktop, Dock and menu bar before you record"
  homepage "https://leversmac.com/"

  livecheck do
    url "https://statics.fore.studio/levers/updates/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Levers.app"

  # quit asks through System Events, which a Terminal without Automation access can't; the
  # signal ends it anyway.
  uninstall quit:   "com.forestudio.Levers",
            signal: [["TERM", "com.forestudio.Levers"]]

  zap trash: [
    "~/Library/Application Support/Levers",
    "~/Library/Caches/com.forestudio.Levers",
    "~/Library/HTTPStorages/com.forestudio.Levers",
    "~/Library/Preferences/com.forestudio.Levers.plist",
  ]
end
