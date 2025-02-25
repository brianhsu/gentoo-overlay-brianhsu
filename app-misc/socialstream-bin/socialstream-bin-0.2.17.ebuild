EAPI="7"
DESCRIPTION="Social Stream Nija"
HOMEPAGE="https://github.com/steveseguin/social_stream"
SRC_URI="https://github.com/steveseguin/social_stream/releases/download/${PV}/socialstream-linux-AppImage.zip"

inherit desktop wrapper xdg-utils

LICENSE="Agent License"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-fs/fuse:0"

RDEPEND="sys-fs/fuse:0"

RESTRICT="strip"

QA_PREBUILT="/opt/socialstream-bin/bin/SocialStream.AppImage"

src_unpack() {

    unpack socialstream-linux-AppImage.zip || die
	cp socialstream-${PV}-x86_64.AppImage SocialStream.AppImage || die
    chmod 755 SocialStream.AppImage || die
    mkdir socialstream-bin-${PV} || die
    cd socialstream-bin-${PV} || die

    ../SocialStream.AppImage --appimage-extract || die
}

src_install() {
    insinto /usr/share
    doins -r squashfs-root/usr/share/icons
    exeinto /opt/socialstream-bin/bin
    doexe ../SocialStream.AppImage
    make_wrapper "${PN}" "/opt/socialstream-bin/bin/SocialStream.AppImage"
    make_desktop_entry "${PN}" "Social Stream Ninja" "socialstream" "Utility;"
}

pkg_postinst() {
    xdg_desktop_database_update
    xdg_icon_cache_update
}

pkg_postrm() {
    xdg_desktop_database_update
    xdg_icon_cache_update
}


