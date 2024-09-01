# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 toolchain-funcs

DESCRIPTION="Groovy Language Server"
HOMEPAGE="https://github.com/GroovyLanguageServer/groovy-language-server"
EGIT_REPO_URI="https://github.com/GroovyLanguageServer/groovy-language-server"

LICENSE="Apache-2.0"
SLOT="0"
RESTRICT=network-sandbox

DEPEND="
	>=dev-java/gradle-bin-8.10
"

DEPEND="
	>=virtual/jdk-17
"

src_compile() {
	GRADLE_USER_HOME="./gradle" gradle build
}

src_install() {
	insinto /usr/share/${P}/lib
	doins build/libs/groovy-language-server-9999-all.jar
	doins build/libs/groovy-language-server-9999.jar

}
