#!/bin/sh
ISERROR=0

which npm > /dev/null 2>&1
if [ $? -ne 0 ] ; then
	echo "command not found: npm"
	echo "please install npm. e.g. sudo port install npm"
	ISERROR=1
fi

which grunt > /dev/null 2>&1
if [ $? -ne 0 ] ; then
	echo "command not found: grunt"
	echo "please install grunt. e.g. npm install -g grunt"
	ISERROR=1
fi

if [ $ISERROR == 1 ] ; then
	exit
fi

rm -rf .sass-cache bower_components bower-task node_modules tsd-cache && \
npm install && \
grunt setup && \
echo "OK!"
