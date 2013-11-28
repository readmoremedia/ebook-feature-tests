#!/usr/bin/env bash

feature_id=${1}

if [ ! ${feature_id} ]; then
    echo "Error: No ID supplied!!!"
else
    echo "Building html document for \"${feature_id}\""

    id_exists=$(xmlstarlet sel -T -t -i "/data/featureset[@id='${feature_id}']" -o "1" --else -o "0" ./src/data.xml)

    if [ ${id_exists} = 1 ]; then
        xsltproc -o ./web/${feature_id}.html \
            --stringparam feature.id ${feature_id} \
            ./src/build-html/transform.xsl ./src/data.xml

        echo "DONE: ${feature_id}.html"
    else
        echo "ERROR: Feature ID not found"
    fi
fi
