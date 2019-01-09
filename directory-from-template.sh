#!/bin/bash

# Author : Grant Langdon
# Copyright (c) https://github.com/grntlngdn


TEMP=/c/users/grntl/OneDrive/Documents/r-projects/new-project-creator/template
RPROJDIR=/c/users/grntl/OneDrive/Documents/r-projects/harvardx-125-data-science

cd $TEMP
FILES=`ls *.R`

cd $RPROJDIR
echo "Name R project:"
read PROJECT
if [ -e ./$PROJECT ]
then
   cd $PROJECT
   PFILES=`ls *.R`
   CFILES=($(comm -12 <(printf '%s\n' "${FILES[@]}") <(printf '%s\n' "${PFILES[@]}")))
   cd ..
else
   mkdir $PROJECT
   CFILES=()
fi
if [ ${#CFILES[@]} -eq 0 ]
then
   echo "What is the primary subject of this project?"
   read SUBJECT
   cp -r $TEMP .
   mv -T template $PROJECT
   cd $PROJECT
   mv template.Rproj $PROJECT.Rproj
   for FILE in $FILES
   do
      sed -i "s/\[Subject\]/$SUBJECT/g" $FILE
   done
else
   echo this directory already contains R files that would be over-written, so the template wasn\'t used
fi
