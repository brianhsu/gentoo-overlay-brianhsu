EAPI="7"
DESCRIPTION="Configuration application of the Ultimate Hacking Keyboard"
HOMEPAGE="https://github.com/UltimateHackingKeyboard/agent"
SRC_URI="https://github.com/UltimateHackingKeyboard/agent/releases/download/v${PV}/UHK.Agent-${PV}-linux-x86_64.AppImage"

inherit desktop wrapper xdg-utils

LICENSE="Agent License"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-fs/fuse:0"

RDEPEND="sys-fs/fuse:0"

RESTRICT="strip"

QA_PREBUILT="/opt/uhk-agent-bin/bin/UHK.Agent.AppImage"

src_unpack() {

   cp ${DISTDIR}/UHK.Agent-${PV}-linux-x86_64.AppImage UHK.Agent.AppImage  || die
   chmod 755 UHK.Agent.AppImage || die
   mkdir uhk-agent-bin-${PV} || die
   cd uhk-agent-bin-${PV} || die

   ../UHK.Agent.AppImage --appimage-extract || die
}

src_install() {
	insinto /usr/share
	doins -r squashfs-root/usr/share/icons
	exeinto /opt/uhk-agent-bin/bin
	doexe ../UHK.Agent.AppImage
    make_wrapper "${PN}" "/opt/uhk-agent-bin/bin/UHK.Agent.AppImage"
	make_desktop_entry "${PN}" "Ultimate Hacking Keyboard Configurator" "uhk-agent" "Utility;"
}

pkg_postinst() {
        xdg_desktop_database_update
        xdg_icon_cache_update
}

pkg_postrm() {
        xdg_desktop_database_update
        xdg_icon_cache_update
}

