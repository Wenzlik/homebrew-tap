cask "quotavadis" do
  version "0.6.3"
  sha256 "dfdb093b3274bf9cf4e9c6bd5e6ab48978da8e7517d32dd973e142aae5fb38a1"

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
