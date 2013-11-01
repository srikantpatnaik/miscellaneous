#!/bin/bash

lynx -dump http://scilab.in/Books_Progress | grep -iA 2000 "Fluid Mechanics:" | grep -B2000 "Disclaimer:" | grep -E "^\ +[0-9]+\.\ " | sed "s/^ *[0-9]*. //g" > progress

lynx -dump http://scilab.in/Completed_Books | grep -iA 2000 "Fluid Mechanics:" | grep -B2000 "Disclaimer:" | grep -E "^\ +[0-9]+\.\ " | sed "s/^ *[0-9]*. //g" > complete

# convert all pdf to text
for each in `ls -1 *.pdf`; do pdftotext $each;done

cat progress | grep  -oE '[b][y].*' | cut -d',' -f 1 | grep -Eo '([^ ]|\\ )*$' > progress-authors

cat complete | grep  -oE '[b][y].*' | cut -d',' -f 1 | grep -Eo '([^ ]|\\ )*$' > complete-authors

cat all-AICTE-UG-books-sorted-717-numbers | sed '/^[a-z]/d' | sed '/^[“|&|(|–]/d'

while read line; do grep -iw "$line" all-AICTE-UG-books-sorted-253-numbers; done < progress-authors-tbc-unique > probable-authors-matched-from-progress_TBC_Books_with_AICTE_253


#scratch pad
cat progress.1 | grep -E -m 1 "[b][y].*" | grep -oE '\s*\S+,' | tr -d '[ ][,]'
cat progress | grep  -oE '[b][y].*' | cut -d',' -f 1 | grep -Eo '([^ ]|\\ )*$'

# read each line from progress and find it in all texts
while read line; do grep -iw $line *.txt; done < progress

while read line; do grep -ia "$line" UG_Civil_aicte_mostly_books; done < all-book-names-tbc-2words

cat all-AICTE-syllabus | grep -i  "Text Books\|Reference Books\|Text/Reference Books" -A 15 | sed '/[0-9].*/d' | sed '/^\s*$/d'
