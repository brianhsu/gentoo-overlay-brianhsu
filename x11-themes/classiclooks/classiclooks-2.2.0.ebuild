EAPI="7"
DESCRIPTION="Xfce ClassicLooks is a linux/freebsd retro-theme focused on providing a consistent look for all industry-standard GUI toolkits."
HOMEPAGE="https://sourceforge.net/projects/classiclooks/"
SRC_URI="https://nchc.dl.sourceforge.net/project/classiclooks/classiclooks-${PV}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
S=${WORKDIR}

RDEPEND="
  >=x11-themes/gtk-engines-murrine-0.98.2-r3
  >=dev-qt/qtstyleplugins-5.0.0_p20170311-r1
"

src_install() {
	default
	insinto /usr/share/themes
	for theme in Classic*; do
        einfo "Install $theme"
		doins -r "$theme"
	done
}

pkg_postinst() {
	elog
	elog "set QT_QPA_PLATFORMTHEME=gtk2 so QT4/QT5 will use this theme"
}

