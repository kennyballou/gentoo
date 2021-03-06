# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="The Original Korn Shell, 1993 revision (ksh93)"
HOMEPAGE="https://github.com/att/ast"

MY_PV="${PV/_/-}"
MY_P="${PN}-${MY_PV}"
SRC_URI="https://github.com/att/ast/releases/download/${MY_PV}/${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="CPL-1.0 EPL-1.0"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~s390 ~sparc ~x86"

RDEPEND="!app-shells/pdksh"

src_install() {
	meson_src_install
	dodir /bin
	mv "${ED}/usr/bin/ksh" "${ED}/bin/ksh" || die
}
