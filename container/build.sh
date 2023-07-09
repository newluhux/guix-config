#!/bin/sh

if [ -z "$1" ]
then
	echo "usage: $0 outdir"
	exit 1
fi

set -ux

SRCDIR=$(dirname $(realpath $0))
OUTDIR=$(realpath $1)

for i in ./*
do
	tag=$(basename $i)
	cd ${SRCDIR}
	if [ -d "$tag" ]
	then
		cd $tag
		docker build -t $tag .
		docker rm $tag
		docker run --name $tag $tag
		rm $OUTDIR/$tag.sqfs
		docker export $tag | sqfstar $OUTDIR/$tag.sqfs
	fi
done
