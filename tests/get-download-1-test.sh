#!/usr/bin/env roundup
#
# This file contains the test plan for the get-download command.
# Execute the plan by invoking: 
#    
#     rerun stubbs:test -m github -p get-download
#

# Helpers
#
[[ -f ./functions.sh ]] && . ./functions.sh

# The Plan
# --------

describe "get-download"

it_can_download() {
  TMPDIR=$(mktemp -d)
  date > ${TMPDIR}/deleteme-2.0.0-$$.noarch.rpm
  rerun github:delete-download --file deleteme-2.0.0-$$.noarch.rpm --owner rerun-modules --repository github --force true
  rerun github:create-download --file ${TMPDIR}/deleteme-2.0.0-$$.noarch.rpm --owner rerun-modules --repository github

  rerun github:get-download --file deleteme-2.0.0-$$.noarch.rpm --owner rerun-modules --repository github --output ${TMPDIR}/deleteme-2.0.0-0.noarch.rpm
  diff ${TMPDIR}/deleteme-2.0.0-$$.noarch.rpm ${TMPDIR}/deleteme-2.0.0-0.noarch.rpm

  rerun github:delete-download --file deleteme-2.0.0-$$.noarch.rpm --owner rerun-modules --repository github
  rm -rf ${TMPDIR}
}

# ------------------------------

