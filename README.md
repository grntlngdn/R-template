# r-project-template-and-creator
This includes the template I use for my R projects and the directory-from-template shell script that creates an R project from it. The script names the new project folder based on user input and substitutes the name of the subject of analysis that the user provides into the relevant places for the objects etc.
Changing the two directory variables and the path to rstudio.exe (in the rstudio function) should allow the script to work as expected.
However, if you always use RStudio by clicking on a file, then you may be using a directory of packages other than the default directory for R packages that is used when a file is opened from a command prompt like this does; to correct this you set the environment variable R_LIBS_USER to the default directory (for me it was ~/R/win-library/3.5) and then move all your packages to that folder. For details see the second higher voted answer here:
https://stackoverflow.com/questions/15170399/change-r-default-library-path-using-libpaths-in-rprofile-site-fails-to-work
