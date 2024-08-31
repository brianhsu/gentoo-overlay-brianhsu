EAPI="7"
DESCRIPTION="Godot Engine - Free and open source 2D and 3D game engine"
HOMEPAGE="https://godotengine.org/"
SRC_URI="https://github.com/godotengine/godot/releases/download/${PV}-stable/Godot_v${PV}-stable_mono_linux_x86_64.zip"

inherit desktop wrapper xdg-utils

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

QA_PREBUILT="/opt/godot/bin/godot"

src_unpack() {
	unzip ${DISTDIR}/Godot_v${PV}-stable_mono_linux_x86_64.zip
	mv Godot_v${PV}-stable_mono_linux_x86_64 godot-mono-bin-${PV}
}
src_install() {
	insinto /opt/godot/bin
	doins -r GodotSharp
	exeinto /opt/godot/bin
	newexe Godot_v${PV}-stable_mono_linux.x86_64 godot
	make_wrapper "${PN}" "/opt/godot/bin/godot"
	make_desktop_entry "${PN}" "Godot Engine - Free and open source 2D and 3D game engine" "godot" "Development;"
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
