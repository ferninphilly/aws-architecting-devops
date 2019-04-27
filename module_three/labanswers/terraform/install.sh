#!/bin/sh
yum install -y httpd
service start httpd
chkonfig httpd on
echo "<html><h1>THE BEES!! NOT THE BEES!! OH MY GOD...THEY'RE IN MY EYES!!! THE BEEEEEEESSS!!!^^</h1></br>--Nicholas Cage</html>" > /var/www/html/index.html