cask "quotavadis" do
  version "0.6.2"
  sha256 "ad4e7fd8b77bb337d5941a7f3997285c32ccf4bba221f9b97927ba01bc1d477e"

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
