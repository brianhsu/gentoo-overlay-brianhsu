EAPI="7"
DESCRIPTION="Neovide"
HOMEPAGE="https://github.com/neovide/neovide"
SRC_URI="
  https://github.com/neovide/neovide/releases/download/${PV}/neovide-linux-x86_64.tar.gz
  https://github.com/neovide/neovide/releases/download/${PV}/neovide.AppImage
"

inherit desktop wrapper xdg-utils

LICENSE="Agent License"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-fs/fuse:0"

RDEPEND="sys-fs/fuse:0"

RESTRICT="strip"

src_unpack() {

   cp ${DISTDIR}/neovide.AppImage neovide.AppImage  || die
   chmod 755 neovide.AppImage || die
   mkdir neovide-bin-${PV} || die
   cd neovide-bin-${PV} || die
   tar -xvzf ${DISTDIR}/neovide-linux-x86_64.tar.gz  || die

   ../neovide.AppImage --appimage-extract || die
}

src_install() {
	insinto /usr/share
	doins -r squashfs-root/usr/share/icons
	doins -r squashfs-root/usr/share/applications

	exeinto /usr/bin
	doexe neovide
}

pkg_postinst() {
        xdg_desktop_database_update
        xdg_icon_cache_update
}

pkg_postrm() {
        xdg_desktop_database_update
        xdg_icon_cache_update
}

