#!/usr/bin/env bash

set -e
shopt -s extglob

# Ensure that the CWD is set to script's location
cd "${0%/*}"
CWD=$(pwd)

INTERACTION=errorstopmode
OUTDIR=dist
JOBNAME=presentation
NOTES="\def\generatenotes{hide}"
SUFFIX=""
FAST=false
SYNCTEX=1

usage() { echo "Usage: $0 [-nsf]" 1>&2; exit 1; }

while getopts "nsf" o; do
	case "${o}" in
		f)
			FAST=true
			;;
		n)
			NOTES="\def\generatenotes{second}"
			SUFFIX="-with-notes"
			;;
		s)
			NOTES="\def\generatenotes{only}"
			SUFFIX="-notes"
			;;
		*)
			usage
			;;
	esac
done
shift $((OPTIND-1))

if [ $FAST == false ]
then
	mkdir -p ${OUTDIR}/tmp
	cp ${OUTDIR}/*.pdf ${OUTDIR}/tmp || true
	rm -f ${OUTDIR}/*.*
	cp ${OUTDIR}/tmp/*.pdf ${OUTDIR} || true
	rm -rf ${OUTDIR}/tmp
	mkdir -p ${OUTDIR}/figures
fi

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

if [ $FAST == false ]
then
	rm -f ${OUTDIR}/*.{aux,log,out,xwm,toc,lof,lot,bib,bbl,bcf,blg,xml,fls,fdb_latexmk,nav,snm}
fi

echo "Done."
