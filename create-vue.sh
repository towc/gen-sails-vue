#!/bin/bash

echo "" &&
echo "# 1" &&
echo "# generating frontend with custom vue template" &&
echo "" &&
vue init towc/vue-template-webpack-sails frontend &&
echo "# SUCCESS 1" &&

echo "" &&
echo "# 2" &&
echo "# entering frontend directory" &&
echo "" &&
cd frontend &&
echo "# SUCCESS 2" &&

echo "" &&
echo "# 3" &&
echo "# installing npm packages #" &&
echo "" &&
npm i &&
echo "# SUCCESS 3" &&

echo "" &&
echo "# 4 (END)" &&
echo "# running build scripts" &&
echo "" &&
npm run build
