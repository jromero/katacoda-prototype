#!/usr/bin/env bash
set -e

# remove unnecessary files
rm -rf .cache .hushlogin .ssh

# set docker config
mkdir ~/.docker
echo "{}" > /root/.docker/config.json

# create structure
mkdir -p ~/ruby-buildpack/

# download latest ruby sample app
git clone --depth=1 https://github.com/buildpack/samples.git /tmp/samples
mv /tmp/samples/apps/ruby-bundler ~/ruby-app

# install pack
curl -sL https://github.com/buildpack/pack/releases/download/v0.5.0/pack-v0.5.0-linux.tgz -o /tmp/pack.tgz
tar xvf /tmp/pack.tgz -C /usr/local/bin/

# set builder
pack set-default-builder cnbs/sample-builder:bionic