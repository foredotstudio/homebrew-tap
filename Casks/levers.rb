cask "levers" do
  version "1.8"
  sha256 "4d7f5134d880a3429b16e1a562007fa419fd61aa8e2c592a793501bd4f6fa590"

  url "https://statics.fore.studio/levers/downloads/Levers-#{version}.dmg"
  name "Levers"
  desc "Menu bar switches and modes for system settings, with a command palette"
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
