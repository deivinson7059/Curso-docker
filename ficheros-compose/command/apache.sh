#!/bin/bash
echo "Estoy en Apache" > /var/www/html/index.html
apachectl -D FOREGROUND
