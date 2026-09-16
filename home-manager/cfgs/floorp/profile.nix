{ config, ... }:
let
  profileName = "${config.home.username}";
in
{
  programs.floorp.profiles.${profileName} = {
    id = 0;
    search = {
      default = "ddg";
      privateDefault = "ddg";
      force = true;
    };

    settings = {
      "sidebar.verticalTabs" = true;
      "browser.ctrlTab.sortByRecentlyUsed" = true;
      "browser.download.useDownloadDir" = false;
      "browser.toolbars.bookmarks.visibility" = "never";
      "browser.tabs.allow_transparent_browser" = true;
      "floorp.panelSidebar.enabled" = false;
      "media.videocontrols.picture-in-picture.enable-when-switching-tabs.enabled" = true;
      "media.eme.mediadrm.origin-id.enabled" = true;
      "widget.use-xdg-desktop-portal.file-picker" = 1;

      "signon.autofillForms" = false;
      "places.history.enabled" = false;
      "browser.contextual-password-manager.enabled" = false;
      "browser.migrate.chrome.payment_methods.enabled" = false;
      "browser.dataFeatureRecommendations.enabled" = false;
      "extensions.htmlaboutaddons.recommendations.enabled" = false;

      "browser.uiCustomization.state" = ''
        {"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["sponsorblocker_ajay_app-browser-action","ublock0_raymondhill_net-browser-action","pywalfox_frewacom_org-browser-action","addon_darkreader_org-browser-action","firefox_tampermonkey_net-browser-action","youtube-anti-translate-mv3_namakeingo_co_uk-browser-action","_88ebde3a-4581-4c6b-8019-2a05a9e3e938_-browser-action","_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","customizableui-special-spring1","vertical-spacer","workspaces-toolbar-button","urlbar-container","customizableui-special-spring2","downloads-button","reset-pbm-toolbar-button","unified-extensions-button","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","_2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c_-browser-action","sidebar-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":[],"vertical-tabs":["tabbrowser-tabs"],"PersonalToolbar":["import-button","personal-bookmarks"],"nora-statusbar":["screenshot-button","fullscreen-button","status-text"]},"seen":["reset-pbm-toolbar-button","developer-button","profile-manager-button","undo-closed-tab","zen-mode-button","workspaces-toolbar-button","screenshot-button","pywalfox_frewacom_org-browser-action","ublock0_raymondhill_net-browser-action","_2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c_-browser-action","addon_darkreader_org-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","firefox_tampermonkey_net-browser-action","youtube-anti-translate-mv3_namakeingo_co_uk-browser-action","_88ebde3a-4581-4c6b-8019-2a05a9e3e938_-browser-action","_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action","sponsorblocker_ajay_app-browser-action"],"dirtyAreaCache":["nav-bar","vertical-tabs","nora-statusbar","TabsToolbar","PersonalToolbar","unified-extensions-area","toolbar-menubar"],"currentVersion":24,"newElementCount":3}	
      '';

      "floorp.design.configs" = ''
        {"globalConfigs":{"userInterface":"photon","faviconColor":false,"appliedUserJs":""},"tabbar":{"tabbarStyle":"horizontal","tabbarPosition":"default","multiRowTabBar":{"maxRowEnabled":false,"maxRow":3}},"tab":{"tabScroll":{"enabled":false,"reverse":false,"wrap":false},"tabMinHeight":30,"tabMinWidth":76,"tabPinTitle":false,"tabDubleClickToClose":false,"tabOpenPosition":-1},"uiCustomization":{"navbar":{"position":"top","searchBarTop":false},"display":{"disableFullscreenNotification":false,"deleteBrowserBorder":false},"special":{"optimizeForTreeStyleTab":false,"hideForwardBackwardButton":false,"stgLikeWorkspaces":false},"multirowTab":{"newtabInsideEnabled":false},"bookmarkBar":{"focusExpand":false,"position":"top"},"qrCode":{"disableButton":false}}}
      '';

      "floorp.panelSidebar.data" = ''
        {"data":[{"id":"default-panel-bookmarks","url":"floorp//bookmarks","width":0,"type":"static"},{"id":"default-panel-history","url":"floorp//history","width":0,"type":"static"},{"id":"default-panel-downloads","url":"floorp//downloads","width":0,"type":"static"},{"id":"default-panel-notes","url":"floorp//notes","width":0,"type":"static"},{"id":"default-panel-translate-google-com","url":"https://translate.google.com","width":0,"type":"web"},{"id":"default-panel-docs-floorp-app","url":"https://docs.floorp.app/docs/features/","width":0,"type":"web"}]}
      '';

      "floorp.newtab.configs" = ''
        {"components":{"topSites":false,"clock":true,"searchBar":true,"firefoxLayout":true},"background":{"type":"random","customImage":null,"fileName":null,"folderPath":null,"selectedFloorp":null,"slideshowEnabled":false,"slideshowInterval":30},"searchBar":{"searchEngine":"default"},"topSites":{"pinned":[{"url":"https://www.cube-soft.jp/","title":"Cubesoft (Sponsor)"},{"url":"https://docs.floorp.app/docs/features/","title":"Floorp Support"}],"blocked":[]}}
      '';

      /**
        **************************************************************************
         * Betterfox                                                                *
         * "Ad meliora"                                                             *
         * version: 150                                                             *
         * url: https://github.com/yokoffing/Betterfox                              *
        ***************************************************************************
      */

      /**
        **************************************************************************
         * SECTION: SECUREFOX                                                       *
        ***************************************************************************
      */
      /**
        TRACKING PROTECTION **
      */
      "browser.contentblocking.category" = "strict";
      "browser.download.start_downloads_in_tmp_dir" = true;
      "browser.uitour.enabled" = false;
      "privacy.globalprivacycontrol.enabled" = true;

      /**
        OCSP & CERTS / HPKP **
      */
      "security.OCSP.enabled" = 0;
      "privacy.antitracking.isolateContentScriptResources" = true;
      "security.csp.reporting.enabled" = false;

      /**
        SSL / TLS **
      */
      "security.ssl.treat_unsafe_negotiation_as_broken" = true;
      "browser.xul.error_pages.expert_bad_cert" = true;
      "security.tls.enable_0rtt_data" = false;

      /**
        DISK AVOIDANCE **
      */
      "browser.cache.disk.enable" = false;
      "browser.privatebrowsing.forceMediaMemoryCache" = true;
      "media.memory_cache_max_size" = 65536;
      "browser.sessionstore.interval" = 60000;

      /**
        SHUTDOWN & SANITIZING **
      */
      "privacy.history.custom" = true;
      "browser.privatebrowsing.resetPBM.enabled" = true;

      /**
        SPECULATIVE LOADING **
      */
      "network.http.speculative-parallel-limit" = 0;
      "network.dns.disablePrefetch" = true;
      "network.dns.disablePrefetchFromHTTPS" = true;
      "browser.urlbar.speculativeConnect.enabled" = false;
      "browser.places.speculativeConnect.enabled" = false;
      "network.prefetch-next" = false;

      /**
        SEARCH / URL BAR **
      */
      "browser.urlbar.trimHttps" = true;
      "browser.urlbar.untrimOnUserInteraction.featureGate" = true;
      "browser.search.separatePrivateDefault.ui.enabled" = true;
      "browser.search.suggest.enabled" = false;
      "browser.urlbar.quicksuggest.enabled" = false;
      "browser.urlbar.groupLabels.enabled" = false;
      "browser.formfill.enable" = false;
      "network.IDN_show_punycode" = true;

      /**
        HTTPS-ONLY MODE **
      */
      "dom.security.https_only_mode" = true;
      "dom.security.https_only_mode_error_page_user_suggestions" = true;

      /**
        PASSWORDS **
      */
      "signon.formlessCapture.enabled" = false;
      "signon.privateBrowsingCapture.enabled" = false;
      "network.auth.subresource-http-auth-allow" = 1;
      "editor.truncate_user_pastes" = false;

      /**
        EXTENSIONS **
      */
      "extensions.enabledScopes" = 5;

      /**
        HEADERS / REFERERS **
      */
      "network.http.referer.XOriginTrimmingPolicy" = 2;

      /**
        CONTAINERS **
      */
      "privacy.userContext.ui.enabled" = true;

      /**
        VARIOUS **
      */
      "pdfjs.enableScripting" = false;

      /**
        SAFE BROWSING **
      */
      "browser.safebrowsing.downloads.remote.enabled" = false;

      /**
        MOZILLA **
      */
      "permissions.default.desktop-notification" = 2;
      "permissions.default.geo" = 2;
      "geo.provider.network.url" = "https://beacondb.net/v1/geolocate";
      "browser.search.update" = false;
      "permissions.manager.defaultsUrl" = "";
      "extensions.getAddons.cache.enabled" = false;

      /**
        TELEMETRY **
      */
      "datareporting.policy.dataSubmissionEnabled" = false;
      "datareporting.healthreport.uploadEnabled" = false;
      "toolkit.telemetry.unified" = false;
      "toolkit.telemetry.enabled" = false;
      "toolkit.telemetry.server" = "data:=";
      "toolkit.telemetry.archive.enabled" = false;
      "toolkit.telemetry.newProfilePing.enabled" = false;
      "toolkit.telemetry.shutdownPingSender.enabled" = false;
      "toolkit.telemetry.updatePing.enabled" = false;
      "toolkit.telemetry.bhrPing.enabled" = false;
      "toolkit.telemetry.firstShutdownPing.enabled" = false;
      "toolkit.telemetry.coverage.opt-out" = true;
      "toolkit.coverage.opt-out" = true;
      "toolkit.coverage.endpoint.base" = "";
      "browser.newtabpage.activity-stream.feeds.telemetry" = false;
      "browser.newtabpage.activity-stream.telemetry" = false;
      "datareporting.usage.uploadEnabled" = false;

      /**
        EXPERIMENTS **
      */
      "app.shield.optoutstudies.enabled" = false;
      "app.normandy.enabled" = false;
      "app.normandy.api_url" = "";

      /**
        CRASH REPORTS **
      */
      "breakpad.reportURL" = "";
      "browser.tabs.crashReporting.sendReport" = false;

      /**
        **************************************************************************
         * SECTION: PESKYFOX                                                        *
        ***************************************************************************
      */
      /**
        MOZILLA UI **
      */
      "extensions.getAddons.showPane" = false;
      "browser.discovery.enabled" = false;
      "browser.shell.checkDefaultBrowser" = false;
      "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
      "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
      "browser.preferences.moreFromMozilla" = false;
      "browser.aboutConfig.showWarning" = false;
      "browser.startup.homepage_override.mstone" = "ignore";
      "browser.aboutwelcome.enabled" = false;
      "browser.profiles.enabled" = true;

      /**
        THEME ADJUSTMENTS **
      */
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "browser.compactmode.show" = true;
      "browser.privateWindowSeparation.enabled" = false; # WINDOWS

      /**
        AI **
      */
      "browser.ai.control.default" = "blocked";
      "browser.ml.enable" = false;
      "browser.ml.chat.enabled" = false;
      "browser.ml.chat.menu" = false;
      "browser.tabs.groups.smart.enabled" = false;
      "browser.ml.linkPreview.enabled" = false;

      /**
        FULLSCREEN NOTICE **
      */
      "full-screen-api.transition-duration.enter" = "0 0";
      "full-screen-api.transition-duration.leave" = "0 0";
      "full-screen-api.warning.timeout" = 0;

      /**
        URL BAR **
      */
      "browser.urlbar.trending.featureGate" = false;

      /**
        NEW TAB PAGE **
      */
      "browser.newtabpage.activity-stream.default.sites" = "";
      "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
      "browser.newtabpage.activity-stream.showSponsored" = false;
      "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;

      /**
        DOWNLOADS **
      */
      "browser.download.manager.addToRecentDocs" = false;

      /**
        PDF **
      */
      "browser.download.open_pdf_attachments_inline" = true;

      /**
        TAB BEHAVIOR **
      */
      "browser.bookmarks.openInTabClosesMenu" = false;
      "browser.menu.showViewImageInfo" = true;
      "findbar.highlightAll" = true;
      "layout.word_select.eat_space_to_next_word" = false;

      /**
        **************************************************************************
         * SECTION: SMOOTHFOX                                                       *
        ***************************************************************************
      */
      # visit https://github.com/yokoffing/Betterfox/blob/main/Smoothfox.js
      # Enter your scrolling overrides below this line:
      "apz.overscroll.enabled" = true;
      "general.smoothScroll" = true;
      "mousewheel.default.delta_multiplier_y" = 275;
      "general.smoothScroll.msdPhysics.enabled" = false;
      /**
        **************************************************************************
         * START: MY OVERRIDES                                                      *
        ***************************************************************************
      */
      # visit https://github.com/yokoffing/Betterfox/wiki/Common-Overrides
      # visit https://github.com/yokoffing/Betterfox/wiki/Optional-Hardening
      # Enter your personal overrides below this line:

      /**
        **************************************************************************
         * END: BETTERFOX                                                           *
        ***************************************************************************
      */
    };
  };
}
