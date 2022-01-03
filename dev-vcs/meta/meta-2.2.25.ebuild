# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit npm

DESCRIPTION="Manage multi-project git"
HOMEPAGE="https://github.com/mateodelnorte/meta"
SRC_URI="https://github.com/mateodelnorte/meta/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND="net-libs/nodejs
		dev-vcs/git"
RDEPEND="${DEPEND}"
BDEPEND="net-libs/nodejs"
