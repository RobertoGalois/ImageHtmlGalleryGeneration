#!/bin/bash

#listing all files image
file=`ls | grep -E '.\.(jpg|jpeg|png|bmp|gif)'`

#each file jpg listed is copied in a thumbnail that is 200px height
for file_name in $file
do
	`convert -thumbnail x200 ./$file_name ./thumb.$file_name`
done

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
    <p>' > ./galerie.html

#include all jpg in galerie.html
for file_name in $file
do 
	echo "      <a href=\"./$file_name\"><img src=\"./thumb.$file_name\" alt=\"\" /></a>" >> ./galerie.html
done

#generate the tail of the html file
echo '    </p>
  </body>
</html>
' >> ./galerie.html
