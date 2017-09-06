#!/bin/bash

echo "#################################" &&
echo "# Creating new terminal for Vue # 1/8" &&
echo "#################################" &&
(x-terminal-emulator -e ./create-vue.sh &);

echo "#################" &&
echo "# removing .git # 2/8" &&
echo "#################" &&
rm -rf .git &&

echo "###########################################" &&
echo "# removing LICENSE, README and .gitignore # 3/8" &&
echo "###########################################" &&
rm LICENSE README.md .gitignore &&

echo "########################################" &&
echo "# generating backend folder with sails # 4/8" &&
echo "########################################" &&
sails new backend &&

echo "##############################" &&
echo "# entering backend directory # 5/8" &&
echo "##############################" &&
cd backend &&

echo "########################################" &&
echo "# generating vue controller with sails # 6/8" &&
echo "########################################" &&
sails generate controller vue &&

echo "#################################" &&
echo "# replacing vue controller file # 7/8" &&
echo "#################################" &&
mv ../vue-controller-serve.js api/controllers/VueController.js &&

echo "############################################" &&
echo "# removing shell scripts for final cleanup # 8/8" &&
echo "############################################" &&
rm create.sh create-vue.sh
