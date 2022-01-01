# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="File and collaboration app, similar to dropbox"
HOMEPAGE="https://github.com/hbons/SparkleShare"
SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz"

LICENSE="GPL-3.0-or-later LGPG-3.0-or-later"
SLOT="0"
KEYWORDS="amd64"
BDEPEND="dev-lang/mono"
S="${WORKDIR}/SparkleShare-3.38"
