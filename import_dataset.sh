#!/bin/bash
for ds in $(ls *.tar.gz); do 
    cp ${ds} .
    cp export.csv .
    file=$(basename ${ds} .tar.gz)
    python << EOF
from pyiron_base import Project
Project("calculation").unpack("${file}")
EOF
#    rm $(basename ${ds})
#    rm export.csv
done
