#!/bin/bash

echo ""
echo "# 1" &&
echo "# Creating new terminal for Vue" &&
echo "" &&
(x-terminal-emulator -e ./create-vue.sh &);
echo "# SUCCESS 1" &&

echo "" &&
echo "# 2" &&
echo "# removing .git" &&
echo "" &&
rm -rf .git &&
echo "# SUCCESS 2" &&

echo "" &&
echo "# 3" &&
echo "# removing LICENSE, README and .gitignore" &&
echo "" &&
rm LICENSE README.md .gitignore &&
echo "# SUCCESS 3" &&

echo "" &&
echo "# 4" &&
echo "# generating backend folder with sails" &&
echo "" &&
sails new backend &&
echo "# SUCCESS 4" &&

echo "" &&
echo "# 5" &&
echo "# entering backend directory" &&
echo "" &&
cd backend &&
echo "# SUCCESS 5" &&

echo "" &&
echo "# 6" &&
echo "# generating vue controller with sails" &&
echo "" &&
sails generate controller vue &&
echo "# SUCCESS 6" &&

echo "" &&
echo "# 7" &&
echo "# replacing vue controller file" &&
echo "" &&
mv ../vue-controller-serve.js api/controllers/VueController.js &&
echo "# SUCCESS 7" &&

echo "" &&
echo "# 8" &&
echo "# removing shell scripts for final cleanup" &&
rm ../create.sh ../create-vue.sh
echo "# SUCCESS 8" &&

echo "# END" &&
echo "" &&
echo "# feel free to \`cd backend\` and \`sails lift\` in any way you want!"
