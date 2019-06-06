#!/usr/bin/env bash

set -e
shopt -s extglob 

# Ensure that the CWD is set to script's location
cd "${0%/*}"
CWD=$(pwd)

INTERACTION=nonstopmode
OUTDIR=dist
JOBNAME=presentation
NOTES=""
SUFFIX=""
SYNCTEX=1

usage() { echo "Usage: $0 [-o]" 1>&2; exit 1; }

while getopts "n" o; do
	case "${o}" in
		n)
			NOTES="\def\generatenotes{true}"
			SUFFIX="-with-notes"
			;;
		*)
			usage
			;;
	esac
done
shift $((OPTIND-1))

mkdir -p ${OUTDIR}/tmp
mv ${OUTDIR}/*.pdf ${OUTDIR}/tmp || true
rm -f ${OUTDIR}/*.*
mv ${OUTDIR}/tmp/*.pdf ${OUTDIR}
rm -rf ${OUTDIR}/tmp

if [ -n "$CI_BUILD_REF" ];
then
	printf "\providecommand{\\\version}{%s}" $(echo $CI_BUILD_REF | cut -c1-8) > version.tex
fi

latexmk -cd -f- -pdf -time \
	-jobname=$JOBNAME$SUFFIX \
	-outdir=$OUTDIR \
	--synctex=${SYNCTEX} \
	--interaction=${INTERACTION} \
	-halt-on-error \
	-pdflatex='xelatex %O "\def\dummy{} '${NOTES}' \input %S "' \
	main

rm -f ${OUTDIR}/*.{aux,log,out,xwm,toc,lof,lot,bib,bbl,bcf,blg,xml,fls,fdb_latexmk,nav,snm}

echo "Done."
