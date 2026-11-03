cask "quotavadis" do
  version "0.6.1"
  sha256 "fe4a71c92dcc1fa62b16a991a12243be22a10dd0d80d4b94a61e829c8ac8a986"

  url "https://zmrhal.cz/quotavadis/QuotaVadis-#{version}.zip"
  name "QuotaVadis"
  desc "Menu bar app for AI coding tool usage limits"
  homepage "https://zmrhal.cz/quotavadis/"

  livecheck do
    url "https://zmrhal.cz/quotavadis/appcast.xml"
    strategy :sparkle do |items|
      items.reject(&:channel).map(&:short_version)
    end
  end

  auto_updates true
  depends_on macos: :sequoia

  app "QuotaVadis.app"
  binary "#{appdir}/QuotaVadis.app/Contents/MacOS/quotavadis-cli", target: "quotavadis"

  uninstall quit: "cz.zmrhal.QuotaVadis"

  zap trash: [
    "~/Library/Application Support/QuotaVadis",
    "~/Library/Caches/cz.zmrhal.QuotaVadis",
    "~/Library/Containers/cz.zmrhal.QuotaVadis.widgets",
    "~/Library/Group Containers/group.cz.zmrhal.QuotaVadis",
    "~/Library/HTTPStorages/cz.zmrhal.QuotaVadis",
    "~/Library/Preferences/cz.zmrhal.QuotaVadis.plist",
    "~/Library/WebKit/cz.zmrhal.QuotaVadis",
  ]
end
