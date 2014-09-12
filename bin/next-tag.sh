#!/bin/zsh
NEXT_TAG=$(git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)' | grep update-version- ) && git tag -am "Version ${NEXT_TAG##update-version-}" ${NEXT_TAG##update-version-}
