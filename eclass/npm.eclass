# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: npm.eclass
# @MAINTAINER:
# Nathan <ndowens@artixlinux.org>
# @AUTHOR:
# Nathan <ndowens@artixlinux.org>
# @SUPPORTED_EAPIS: 8
# @BLURB: Script to help with nodejs pkgs 
# @DESCRIPTION: Works with nodejs pkgs

if [[ ! ${_NPM_ECLASS} ]]; then

case ${EAPI} in
	8) ;;
	*) die "${ECLASS}: EAPI ${EAPI} unsupported."
esac

_NPM_ECLASS=1
fi

src_install() {
	npm install --legacy-peer-deps -g --user root --prefix "${D}"/usr ${DISTDIR}/"${P}.tar.gz"
	chmod -R u=rwX,go=rX "$D"
	chown -R root:root "$D"

	for dep in semver; do
		rm -r $dep;
	done
}
