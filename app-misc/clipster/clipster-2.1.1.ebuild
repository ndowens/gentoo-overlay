# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{7,8,9,10} )
inherit distutils-r1 git-r3
DESCRIPTION="Lightweight clipboard manager"
HOMEPAGE="https://github.com/mrichar1/clipster"
EGIT_REPO_URI="https://github.com/mrichar1/clipster"

LICENSE="AGPL-3.0-or-later"
SLOT="0"
KEYWORDS="amd64"

