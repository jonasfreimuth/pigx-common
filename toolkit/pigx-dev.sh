#!/bin/bash
# -*- bash -*-
# PiGx Developer Toolkit.
#
# Copyright © 2021 Alexander Blume <alexander.blume@mdc-berlin.de>
#
# This file is provided to help the developers of the PiGx Pipelines.
#
# Change History
# 08/06/2021 Alexander Blume    Update help message.
#
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.



VERSION="0.0.2"
DESCRIPTION="PiGx developer toolkit"

usage() {
   # display help message
  echo "Usage: $0 [ subcommand [-c num] ] [-v]"
  echo
  echo "Available subcommands are:"
  echo "    b|build     Initialise pipeline from git folder, running bootstrap and configure"
  echo "    c|clean     Remove test files"
  echo "    t|test      Run tests"
  echo 
  echo "    -v|--version   Show toolkit version"
  echo "    -h|--help      Show this help"
}

build() {
	## initialisation to run pipeline both from git folder and
	## from any folder with absolute path as [git-folder]/local_install/pigx-bsseq ...
  	./bootstrap.sh
	./configure --prefix=$PWD/local_install --disable-r-packages-check
	make install
}

clean() {
	# remove test files
	make clean
}

test() {
    # run all tests
    make check
}


default() {
  local OPTIND
  while getopts ":v" opt; do
    case "${opt}" in
      v)
        echo -e "${DESCRIPTION}, Version v${VERSION}"
        exit 1
        ;;
    esac
  done
  shift $((OPTIND-1))
  usage
}


case "$1" in
  b|build)
    build
    ;;
  c|clean)
    clean
    ;;
  t|test)
    test
    ;;
  *)
    default "$@"
    exit 1
    ;;
esac


