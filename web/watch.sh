#!/bin/sh

cp src/manifest.development.json src/manifest.json

preact watch --template src/template.html --port 8099

