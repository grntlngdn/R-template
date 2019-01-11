#!/bin/bash

# Author : Grant Langdon
# Copyright (c) https://github.com/grntlngdn


TEMP=/c/users/grntl/OneDrive/Documents/r-projects/new-project-creator/template
RPROJDIR=/c/users/grntl/OneDrive/Documents/r-projects/harvardx-125-data-science

#Function to open file with Rstudio
rstudio () {
   /c/'Program Files'/RStudio/bin/rstudio.exe $1 &#change this to represent where rstudio.exe is
}

cd $TEMP
FILES=`ls *.R`

#Note that when entering project name you can enter it as a subdirectory of an existing directory i.e. existing/project
cd $RPROJDIR
echo "R project name (use relative path like 'subfolder/project' to create project in subfolder):"
read PROJECT

#If the project's directory already exists this gets a list of files in common between it and the template; if not it makes the directory
if [ -e ./$PROJECT ]
then
   cd $PROJECT
   PFILES=`ls *.R`
   CFILES=($(comm -12 <(printf '%s\n' "${FILES[@]}") <(printf '%s\n' "${PFILES[@]}")))
   cd `echo $PROJECT | sed -e 's/^[^\/]*/\.\./' -e 's|/[^\/]*|/\.\.|'`
else
   mkdir $PROJECT
   CFILES=()
fi
#If no R files would be overwritten by doing so the template is copied and modified based on user input
if [ ${#CFILES[@]} -eq 0 ]
then
   echo "What is the primary subject of this project?"
   read SUBJECT
   cp -r $TEMP .
   mv -T template $PROJECT

   cd $PROJECT
   mv template.Rproj $SUBJECT.Rproj
   for FILE in $FILES
   do
      sed -i "s/\[Subject\]/$SUBJECT/g" $FILE
   done
else
   echo this directory already contains R files that would be over-written, so the template wasn\'t used
   cd $PROJECT
fi
RPROJ=`ls *.Rproj`
rstudio $RPROJ