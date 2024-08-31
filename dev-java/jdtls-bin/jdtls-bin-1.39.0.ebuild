EAPI="7"
DESCRIPTION="Eclipse JDT Language Server"
HOMEPAGE="https://github.com/eclipse-jdtls/eclipse.jdt.ls"
SRC_URI="https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/${PV}/jdt-language-server-${PV}-202408291433.tar.gz"

inherit desktop wrapper xdg-utils

LICENSE="Agent License"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=virtual/jdk-17"

RESTRICT="strip"

src_unpack() {
	mkdir jdtls-bin-${PV}
	tar -xvzf ${DISTDIR}/jdt-language-server-${PV}-202408291433.tar.gz -C jdtls-bin-${PV}
}


src_install() {
	insinto /opt/jdtls
	doins -r .
	exeinto /opt/jdtls/bin
	doexe bin/jdtls
	doexe bin/jdtls.bat
	doexe bin/jdtls.py
}


