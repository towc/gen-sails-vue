#!/bin/bash

(x-terminal-emulator -e ./create-vue.sh &);
sails new backend &&
cd backend &&
sails generate controller vue &&
mv ../vue-controller-serve.js api/controllers/VueController.js
