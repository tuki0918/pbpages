#!/bin/sh

set -e

git config --global user.name "Github CI"
git config --global user.email "github-ci@example.com"

sh -c "npm $*"
