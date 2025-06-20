#!/bin/bash

# This script creates a specified project folder structure at a given location.
# Usage: create_project <project_name> [optional_project_location]

# Check if project name is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <project_name> [optional_project_location]"
  echo "  Example: $0 my_awesome_project"
  echo "  Example: $0 my_awesome_project /home/user/projects"
  exit 1
fi

PROJECT_NAME=$1
PROJECT_LOCATION=""

# Check if the project location argument is provided
if [ -n "$2" ]; then
  PROJECT_LOCATION="$2"
else
  # If no location is provided, use the current directory
  PROJECT_LOCATION=$(pwd)
fi

# Combine project location with project name for the full path
FULL_PROJECT_PATH="$PROJECT_LOCATION/$PROJECT_NAME"

# Check if the specified project location is valid (parent directory exists)
if [ ! -d "$PROJECT_LOCATION" ]; then
  echo "Error: The specified project location '$PROJECT_LOCATION' does not exist or is not a directory."
  exit 1
fi

# Create the main project folder at the specified location
echo "Creating project folder: $PROJECT_NAME in $FULL_PROJECT_PATH..."
mkdir -p "$FULL_PROJECT_PATH"
# Check if folder creation was successful
if [ $? -ne 0 ]; then
  echo "Error: Failed to create folder '$FULL_PROJECT_PATH'. It might already exist or permissions are insufficient."
  exit 1
fi

# Navigate into the main project directory
cd "$FULL_PROJECT_PATH" || { echo "Error: Failed to navigate into '$FULL_PROJECT_PATH'."; exit 1; }

echo "Creating root files..."
# Create main files in the project root
touch run.dev.sh
touch run.prod.sh
touch .env
touch .env.example

echo "Creating 'src' folder structure..."
# Create src directory and its contents
mkdir -p src
cd src || { echo "Error: Failed to navigate into 'src' directory."; exit 1; }

# Files and folders directly under src
echo "  Creating main.ts and router folder..."
touch main.ts
mkdir router

# Folder and files inside src/app
echo "  Creating 'app' folder..."
mkdir -p app
touch app/bootstrap.ts

# Folders inside src/data
echo "  Creating 'data' folder..."
mkdir -p data/model
mkdir -p data/repository

# Folders inside src/domain
echo "  Creating 'domain' folder..."
mkdir -p domain/dtos
mkdir -p domain/entities
mkdir -p domain/repositories
mkdir -p domain/usecases

# Handler folder
echo "  Creating 'handler' folder..."
mkdir -p handler

# Folders and files inside src/infra
echo "  Creating 'infra' folder..."
mkdir -p infra
cd infra || { echo "Error: Failed to navigate into 'infra' directory."; exit 1; }

# Sub-folders inside infra/job
echo "    Creating 'infra/job' folder..."
mkdir -p job/event
mkdir -p job/queue
mkdir -p job/service
mkdir -p job/worker

# Sub-folders and files inside infra/config
echo "    Creating 'infra/config' folder..."
mkdir -p config
touch config/database.conf.ts
touch config/types.ts
touch config/provider.ts

# Sub-folders and files inside infra/database
echo "    Creating 'infra/database' folder..."
mkdir -p database
touch database/mysql.resolver.ts

# Other sub-folders in infra
echo "    Creating 'infra/helper', 'lib', 'locale', 'logger', 'middleware' folders..."
mkdir -p helper
mkdir -p lib
mkdir -p locale
mkdir -p logger
mkdir -p middleware

# Sub-folders and files inside infra/port
echo "    Creating 'infra/port' folder..."
mkdir -p port
touch port/database.interface.ts
touch port/services.interface.ts

# Infra/server and infra/service sub-folders
echo "    Creating 'infra/server' and 'infra/service' folders..."
mkdir -p server
mkdir -p service

# Return to the main project directory (outside src)
cd ../.. || { echo "Error: Failed to return to the main project directory."; exit 1; }

# Create test directory
echo "Creating 'test' folder..."
mkdir -p test

echo "Project '$PROJECT_NAME' successfully created with the requested structure!"
echo "Project location: $(pwd)"
