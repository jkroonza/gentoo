# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: ruby-utils.eclass
# @MAINTAINER:
# Ruby team <ruby@gentoo.org>
# @AUTHOR:
# Author: Hans de Graaff <graaff@gentoo.org>
# @SUPPORTED_EAPIS: 5 6 7 8
# @BLURB: An eclass for supporting ruby scripts and bindings in non-ruby packages
# @DESCRIPTION:
# The ruby-utils eclass is designed to allow an easier installation of
# Ruby scripts and bindings for non-ruby packages.
#
# This eclass does not set any metadata variables nor export any phase
# functions. It can be inherited safely.

if [[ ! ${_RUBY_UTILS} ]]; then

case ${EAPI} in
	5|6)
		ewarn "${CATEGORY}/${PF}: ebuild uses ${ECLASS} with deprecated EAPI ${EAPI}!"
		ewarn "${CATEGORY}/${PF}: Support will be removed on 2024-10-08. Please port to newer EAPI."
		;;
	7|8) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

# @ECLASS_VARIABLE: RUBY_TARGETS_PREFERENCE
# @INTERNAL
# @DESCRIPTION:
# This variable lists all the known ruby targets in preference of use as
# determined by the ruby team. By using this ordering rather than the
# USE_RUBY mandated ordering we have more control over which ruby
# implementation will be installed first (and thus eselected). This will
# provide for a better first installation experience.

# All stable RUBY_TARGETS
RUBY_TARGETS_PREFERENCE="ruby32 ruby31 "

# All other active ruby targets
RUBY_TARGETS_PREFERENCE+="ruby33"

_ruby_implementation_depend() {
	local rubypn=
	local rubyslot=

	case $1 in
		ruby1[89]|ruby2[0-7]|ruby3[0-3])
			rubypn="dev-lang/ruby"
			rubyslot=":${1:4:1}.${1:5}"
			;;
		ree18)
			rubypn="dev-lang/ruby-enterprise"
			rubyslot=":1.8"
			;;
		jruby)
			rubypn="dev-java/jruby"
			rubyslot=""
			;;
		rbx)
			rubypn="dev-lang/rubinius"
			rubyslot=""
			;;
		*) die "$1: unknown Ruby implementation"
	esac

	echo "$2${rubypn}$3${rubyslot}"
}

_RUBY_UTILS=1
fi
