#!/bin/bash
for ds in $(ls notebooks/calculation/*.tar.gz); do 
    cp ${ds} .
    cp notebooks/calculation/export.csv .
    file=$(basename ${ds} .tar.gz)
    echo "${file}"
    python << 'EOF'
from pyiron_base import Project
Project("notebooks/calculation").unpack("saved_job")
EOF
    rm $(basename ${ds})
    rm export.csv
done
