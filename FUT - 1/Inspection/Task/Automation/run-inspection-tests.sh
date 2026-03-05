#!/bin/bash

# Inspection Automation Test Runner
# This script runs the Inspection API automation tests using Bruno CLI

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
COLLECTION_PATH="FUT - 1"
AUTOMATION_FOLDER="Inspection/Task/Automation"
ENV_FILE="${COLLECTION_PATH}/environments/DEV.bru"

echo -e "${YELLOW}========================================${NC}"
echo -e "${YELLOW}  Inspection API Automation Test Suite${NC}"
echo -e "${YELLOW}========================================${NC}"
echo ""

# Check if Bruno CLI is installed
if ! command -v bru &> /dev/null; then
    echo -e "${RED}Error: Bruno CLI (bru) is not installed.${NC}"
    echo "Please install it first:"
    echo "  npm install -g @usebruno/cli"
    exit 1
fi

# Check if environment file exists
if [ ! -f "$ENV_FILE" ]; then
    echo -e "${RED}Error: Environment file not found: $ENV_FILE${NC}"
    exit 1
fi

# Display environment being used
echo -e "${GREEN}Using environment: DEV${NC}"
echo ""

# Run the automation tests
echo -e "${YELLOW}Running Inspection Automation Tests...${NC}"
echo ""

# Execute the automation folder tests sequentially
# Note: The tests must be run in order (1 -> 2 -> 3 -> 4 -> 5)
bru run \
    --collection "$COLLECTION_PATH" \
    --folder "$AUTOMATION_FOLDER" \
    --environment DEV \
    --output results/inspection-results.json \
    --format json

# Check exit code
if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}  All Inspection Tests Passed!${NC}"
    echo -e "${GREEN}========================================${NC}"
    exit 0
else
    echo ""
    echo -e "${RED}========================================${NC}"
    echo -e "${RED}  Inspection Tests Failed!${NC}"
    echo -e "${RED}========================================${NC}"
    exit 1
fi
