#! /bin/bash

# Check if the starting comment exists and continue only if not
if ! grep -Fxq '<!--START_SECTION:activity-->' README.md
then
    # Find the line number of Recent Activity
    ln=$(grep -wn "#### ⚡ Recent Activity" README.md | cut -d: -f1)

    # Increment it by 3
    ln=$((ln + 3))

    # Add the starting comment
    sed -i "${ln} i\<\!--START_SECTION:activity-->" README.md

    # Increment line number again by 12
    ln=$((ln + 12))

    # Add the ending comment
    sed -i "${ln} i\<\!--END_SECTION:activity-->" README.md
fi