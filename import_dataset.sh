#!/bin/bash
for ds in $(ls calculation/*.tar.gz); do 
    cp ${ds} .
    cp calculation/export.csv .
    file=$(basename ${ds} .tar.gz)
    echo "${file}"
    python << 'EOF'
from pyiron_base import Project
Project("temp").unpack("saved_job")
EOF
    rm $(basename ${ds})
    rm export.csv
done
