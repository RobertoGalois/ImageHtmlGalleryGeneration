############################
# if you want to undo what #
# galerie.sh did           #
# it take in parameter the #
# name of the html document#
# if it is not specified,  #
# it will delete           #
# galerie.html             #
############################

#!/bin/bash

if [ $# -eq 1 ]
then 
	html_file_name=$1
else
	html_file_name='galerie'
fi

#delete all thumbnails
rm ./thumb.*

#delete html file
rm "./$html_file_name.html"
