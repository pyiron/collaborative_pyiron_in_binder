#!/bin/bash
for ds in $(ls ~/notebooks/calculation/*.tar.gz); do 
    cp ${ds} .
    cp notebooks/calculation/export.csv .
    file=$(basename ${ds} .tar.gz)
    echo "${file}"

    python -c "from pyiron_base import Project
pr=Project('notebooks/calculation')
pr.unpack('saved_job')
"

    rm $(basename ${ds})
    rm export.csv
done

