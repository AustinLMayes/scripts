#!/usr/bin/env bash

# Common server setup utils
# PROJECT_ROOT - Root path for all projects
# PLUGINS_PROJECT_ROOT - path of multi-module project containing all plugins
# Austor: Austin Mayes

# Copy a file to the root server directory
# $1 - path to project containing jar
# $2 - base name of the jar
to_root() {
  SRC="$PROJECT_ROOT/$1/target/$2*.jar"
  DEST="."
  echo "Copying $2 ($SRC) to $DEST"
  cp $SRC "$DEST/$2.jar"
}

# Copy a file to the plugins/ directory (must exist)
# $1 - path to plugin project
# $2 - base name of the plugin jar
to_plugins() {
  SRC="$PLUGINS_PROJECT_ROOT/$1/target/$2*.jar"
  DEST="plugins"
  echo "Copying $2 ($SRC) to $DEST"
  cp $SRC "$DEST/$2.jar"
}

# Start the server and re-run this script forever
# $1 - path to server jar
# $2 - script to run on server stop
run_server() {
  echo Starting $1.jar in 3 seconds...
  sleep 3
  java -jar $1.jar
  echo Restarting in 5 seconds... CTRL-C to CEASE!
  sleep 5
  $2
}
