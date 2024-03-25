# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools xdg-utils gnome2-utils

DESCRIPTION="Helpful utility to attack Repetitive Strain Injury (RSI)"
HOMEPAGE="http://www.workrave.org/"
MY_PV=$(ver_rs 1- '_')
SRC_URI="https://github.com/rcaelers/${PN}/releases/download/v${MY_PV}/workrave-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"

# dbus support looks to be used only for trying to use panel applets on gnome3!
IUSE="appindicator doc gnome gstreamer introspection mate nls pulseaudio test xfce"
RESTRICT="!test? ( test )"
REQUIRED_USE="
  appindicator? ( introspection )
  xfce? ( introspection )
  ${PYTHON_REQUIRED_USE}
"

RDEPEND="
	>=dev-libs/glib-2.70.2
	>=x11-libs/gtk+-3.24.30[introspection?,X]
	>=dev-cpp/gtkmm-3.24.5:3.0
	>=dev-cpp/glibmm-2.66.2:2
	>=dev-libs/libsigc++-2.10.7:2
	appindicator? (
		>=dev-libs/libdbusmenu-0.4[gtk3,introspection]
		>=dev-libs/libindicator-0.4:3 )
	gnome? ( >=gnome-base/gnome-shell-3.6.2 )
	gstreamer? (
		media-libs/gstreamer:1.0[introspection?]
		media-libs/gst-plugins-base:1.0[introspection?]
		media-plugins/gst-plugins-meta:1.0 )
	introspection? ( dev-libs/gobject-introspection:= )
	mate? ( mate-base/mate-applets )
	pulseaudio? ( >=media-sound/pulseaudio-13.0-r1 )
	xfce? (
		>=x11-libs/gtk+-2.6.0:2[introspection?]
		>=xfce-base/xfce4-panel-4.4 )
	x11-libs/libXScrnSaver
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXtst
	x11-libs/libXt
	x11-libs/libXmu
	${PYTHON_DEPS}
"

DEPEND="${RDEPEND}
	dev-util/glib-utils
	>=dev-util/intltool-0.40.0
	x11-base/xorg-proto
	virtual/pkgconfig
	doc? (
		app-text/docbook-sgml-utils
		app-text/xmlto )
	nls? ( >=sys-devel/gettext-0.17 )
"

src_prepare() {
    default
	eautoreconf
}

src_configure() {
	econf \
		--disable-distribution \
		--disable-xml \
	    $(use_enable xfce) \
		$(use_enable appindicator indicator) \
		$(use_enable doc manual) \
		$(use_enable gnome gnome3) \
		$(use_enable gstreamer) \
		$(use_enable introspection) \
		$(use_enable mate) \
		$(use_enable nls) \
		$(use_enable pulseaudio pulse) \
		$(use_enable test tests)
}

pkg_postinst() {
	    gnome2_schemas_update
        xdg_desktop_database_update
        xdg_icon_cache_update
}

pkg_postrm() {
	    gnome2_schemas_update
        xdg_desktop_database_update
        xdg_icon_cache_update
}

