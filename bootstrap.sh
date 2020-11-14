#!/bin/sh

# Grab repository.
if [ ! -d $_projects_dir/$_remote_repo ]; then
    _projects_dir=~/Projects
    _remote_account=unilock
    _remote_repo=dotfiles
    _remote_branch=master

    echo "Creating projects directory..."
    mkdir -p $_projects_dir/$_remote_repo

    echo "Downloading dotfiles..."
    curl -L https://github.com/$_remote_account/$_remote_repo/tarball/$_remote_branch | tar -xzv --strip-components 1 -C $_projects_dir/$_remote_repo
fi

# Do it.
cd $_projects_dir/$_remote_repo

install.sh