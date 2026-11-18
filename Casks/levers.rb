cask "levers" do
  version "1.8.2"
  sha256 "61ef67c95ed9fc5849319592da9f363a92e8f27de61bc2617ab4b27cccb98244"

  url "https://statics.fore.studio/levers/downloads/Levers-#{version}.dmg"
  name "Levers"
  desc "Menu bar manager with switches, modes and a command palette"
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
