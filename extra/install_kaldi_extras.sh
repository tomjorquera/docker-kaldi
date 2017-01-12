#!/bin/sh

me=`basename "$0"`

for file in extras/install_*
do

		case "$file" in
				"extras/install_atlas.sh"\
						| "extras/install_beamformit.sh"\
						| "extras/install_openblas.sh"\
						| "extras/install_srilm.sh"\
						| "extras/install_faster_rnnlm.sh")
				# we do not install those
				;;
				"extras/install_sacc.sh")
						# this one returns a 1 on a successful install for some reason...
						sh "$file"
						;;
				"extras/install_mikolov_rnnlm.sh")
						sh "$file" rnnlm-0.3e || exit 1
						;;
				*)
						sh "$file" || exit 1
						;;
		esac
done
