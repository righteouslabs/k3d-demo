#!/bin/bash

# Stop on any errors
set -e

# Set bash verbose logging
set -o verbose

# Print start of this file
echo "👟 Start of postCreateCommand.sh"

# Initialize all Git submodules
git config --global --replace-all "safe.directory" "*"
git submodule status
git submodule update --init
git submodule status

# Print the end of this file
echo "🏁 End of postCreateCommand.sh"
