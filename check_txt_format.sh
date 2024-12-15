#!/bin/bash

STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM)

for FILE in $STAGED_FILES; do

   if [[ $FILE == *.txt ]]; then
 
      if ! tail -n 1 "$FILE" | grep -iq "author's signature"; then

        echo "Error: File '$FILE' does not contain author signature at the end."
   
        exit 1
      fi
   fi
done



exit 0
