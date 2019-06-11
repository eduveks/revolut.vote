#!/bin/bash

cp src/manifest.production.json src/manifest.json

preact build --no-prerender --template src/template.html

mv build/index.html build/index.php

cp sitemap.xml build/sitemap.xml

cp robots.txt build/robots.txt

