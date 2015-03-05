#!/bin/bash

## should have a configure file if you got the offical source tarball
# if [ ! -f configure ];
# then
#    # Make the configure file. Need autoreconf, libtool, libexpat-dev for this.
#    autoreconf -i --force
# fi

./configure --prefix=$PREFIX
make
make install

if [[ $(uname) == Darwin ]]; then
    cp ${RECIPE_DIR}/patchbinary.py ${PREFIX}/
    echo ${PREFIX} > ${PREFIX}/build_prefix.a
fi
