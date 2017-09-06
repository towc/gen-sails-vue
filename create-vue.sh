#!/bin/bash

echo "################################################" &&
echo "# generating frontend with custom vue template #" &&
echo "################################################" &&
vue init towc/vue-template-webpack-sails frontend &&

echo "###############################" &&
echo "# entering frontend directory #" &&
echo "###############################" &&
cd frontend &&

echo "###########################" &&
echo "# installing npm packages #" &&
echo "###########################" &&
npm i &&

echo "#########################" &&
echo "# running build scripts # 4/4" &&
echo "#########################" &&
npm run build
