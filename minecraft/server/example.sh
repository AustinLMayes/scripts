#!/usr/bin/env bash

# Example server start script
# Austor: Austin Mayes

# Load in common functions
source commons.sh
# Set needed variables
PROJECT_ROOT=/some/projects/place
PLUGINS_PROJECT_ROOT=$PROJECT_ROOT/maven-project

# Ensure plugins always exists
mkdir -p plugins

# Copy in server jar
to_root SportBukkit/build/CraftBukkit sportbukkit

# Copy in plugins
to_plugins API/bukkit api-bukkit
to_plugins API/ocn api-ocn
to_plugins Commons/bukkit commons-bukkit
to_plugins PGM PGM

# Run the server
run_server sportbukkit ./run.sh
