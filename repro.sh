#!/bin/bash

set -e
set -x

SDK_VERSION=${1:?"SDK_VERSION is required"}

cd MyFancyLibrary
dotnet build
dotnet pack -o output
cd ..
docker build -t irrelevant-image-name --build-arg="SDK_VERSION=$SDK_VERSION" .
