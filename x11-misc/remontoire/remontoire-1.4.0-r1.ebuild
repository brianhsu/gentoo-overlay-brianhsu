EAPI="7"
DESCRIPTION="A keybinding viewer for i3 and other programs."
HOMEPAGE="https://github.com/regolith-linux/remontoire"
SRC_URI="https://github.com/regolith-linux/remontoire/archive/refs/tags/${PV}.tar.gz"

inherit meson vala gnome2-utils

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
  >=dev-libs/libgee-0.20.4
  >=dev-lang/vala-0.52.8
  >=dev-build/meson-1.4.0
  >=x11-libs/gtk+-3.24.30
"

src_prepare() {
	default
	vala_src_prepare
}

src_install() {
	meson_install
	mv -v ${D}/usr/share/appdata ${D}/usr/share/metainfo
	dobin ${FILESDIR}/remontoire-toogle
	dodir /usr/share/remontoire
	insinto /usr/share/remontoire
	doins ${FILESDIR}/stylesheet.css
}

pkg_postinst() {
    gnome2_schemas_update
}

pkg_postrm() {
    gnome2_schemas_update
}

