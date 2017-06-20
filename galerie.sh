#################################
# it take one parameter that is #
# the name of the html document #
# if it is not specified, the   #
# name will be galerie.html     #
#################################

#!/bin/bash

#listing all files image
file=`ls | grep -E '.\.(jpg|jpeg|png|bmp|gif)'`

#each file jpg listed is copied in a thumbnail
for file_name in $file
do
	`convert -thumbnail x200 ./$file_name ./thumb.$file_name`
done

#definition of the name of the html file
if [ $# -eq 1 ] 
then 
	html_file_name=$1
else
	html_file_name='galerie'
fi

#generate the head of the html file
echo -e '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" >
  <head>
    <title>Ma galerie</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style type="text/css">
      a img { border:0; }
    </style>
  </head>
  <body>
    <p>' > "./$html_file_name.html"

#include all jpg in galerie.html
for file_name in $file
do 
	echo "      <a href=\"./$file_name\"><img src=\"./thumb.$file_name\" alt=\"\" /></a>" >> "./$html_file_name.html"
done

#generate the tail of the html file
echo '    </p>
  </body>
</html>
' >> "$html_file_name./.html"
