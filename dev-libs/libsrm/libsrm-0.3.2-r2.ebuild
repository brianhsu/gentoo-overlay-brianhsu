EAPI="7"
DESCRIPTION="Simple Rendering Manager"
HOMEPAGE="https://cuarzosoftware.github.io/SRM/"
SRC_URI="https://github.com/CuarzoSoftware/SRM/archive/refs/tags/v${PV}-2.tar.gz"

inherit meson

S="${WORKDIR}/SRM-${PV}-2/src"
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
"

