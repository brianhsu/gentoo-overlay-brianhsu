EAPI="7"
DESCRIPTION="Louvre is a high-performance C++ library designed for building Wayland compositors with a strong emphasis on ease of development."
HOMEPAGE="https://cuarzosoftware.github.io/Louvre/"
SRC_URI="https://github.com/CuarzoSoftware/Louvre/archive/refs/tags/v${PV}-1.tar.gz"

inherit meson
S="${WORKDIR}/${P}-1/src"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

BDEPEND="
  >=virtual/pkgconfig-2
  >=dev-util/cmake-3.27.9
"

DEPEND="
  >=media-libs/libglvnd-1.7.0
  >=virtual/libudev-251
  >=x11-libs/libdrm-2.4.118
  >=media-libs/mesa-23.3.0
  >=media-libs/libdisplay-info-0.1.1
  >=sys-auth/seatd-0.8.0
  >=dev-libs/wayland-1.22.0
  >=dev-libs/libsrm-0.3.2-r2
  >=x11-libs/libXcursor-1.2.1
  >=x11-libs/libxkbcommon-1.6.0
  >=dev-libs/libinput-1.24.0
  >=x11-libs/pixman-0.42.2
  >=media-libs/freeimage-3.18.0
  >=dev-libs/weston-13.0.0
"
