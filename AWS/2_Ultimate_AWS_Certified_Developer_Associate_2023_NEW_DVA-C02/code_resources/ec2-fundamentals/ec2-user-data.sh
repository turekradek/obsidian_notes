#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
# echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
echo '<!DOCTYPE html>
<html>
<head>
<title>Radek Simple HTML File</title>
<style>
body {
color: blue;
background-color: black;
}
</style>
</head>
<body>' > /var/www/html/index.html
echo "<h1>Hello World from $(hostname -f)</h1>" >> /var/www/html/index.html
echo '
This is my simple HTML file.  </br>
<span style="font-size: 20px; color: green;" > Changed color green 20 px </span> </br>
<span style="font-size: 18px; color: yellow;" > Changed color yellow 18 px</span> </br>
<span style="font-size: 30px; color: white;" > Changed color white 30 px </span> </br>
<span style="font-size: 24px; color: red;" > Changed color red 24 px</span> </br>
<span style="font-size: 28px; color: grey;" > Changed color grey 28 px</span> </br>
</body>
</html>' >> /var/www/html/index.html