#!/bin/bash

(x-terminal-emulator -e ./create-vue.sh &);
rm -rf .git &&
rm LICENSE README.md .gitignore &&
sails new backend &&
cd backend &&
sails generate controller vue &&
mv ../vue-controller-serve.js api/controllers/VueController.js &&
rm create.sh create-vue.sh
