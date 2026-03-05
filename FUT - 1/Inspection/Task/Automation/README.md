# Inspection API Automation Suite

This folder contains automated test scripts for the Inspection API endpoints using Bruno.

## Test Flow

The automation tests follow a sequential order to test the full CRUD lifecycle:

1. **1. Create Inspection Task** - Creates a new inspection task
2. **2. Get Created Task ID** - Retrieves the created task ID by title
3. **3. Get Inspection Task Detail** - Verifies the created task details
4. **4. Edit Inspection Task** - Updates the created task
5. **5. Delete Inspection Task** - Deletes the created task (cleanup)

## Prerequisites

- Bruno CLI installed (`npm install -g @usebruno/cli`)
- Access to the API environment
- Valid credentials in the environment file

## Running the Tests

### Using Shell Script (Linux/macOS)

```bash
cd "/FUT - 1/Inspection/Task/Automation"
chmod +x run-inspection-tests.sh
./run-inspection-tests.sh
```

### Using PowerShell (Windows)

```powershell
cd "FUT - 1\Inspection\Task\Automation"
.\run-inspection-tests.ps1 -Environment DEV
```

### Using Bruno CLI directly

```bash
# Run all tests in the Automation folder
bru run --collection "FUT - 1" --folder "Inspection/Task/Automation" --environment DEV

# Run specific test
bru run --collection "FUT - 1" --request "Inspection/Task/Automation/1. Create Inspection Task" --environment DEV
```

## Environment Configuration

The tests use environment variables defined in:
- `../environments/DEV.bru` - Development environment

Required variables:
- `base-url` - Base URL of the API
- `accessToken` - Authentication token (obtained from Login request)

## Test Data

The tests use the following static data:
- Title: "Automation Inspection Task"
- RFI Number: "AUTO-INSP-001"
- All tests share state using Bruno variables (`inspectionTaskId`, `inspectionTaskCode`)

## Output

Test results are saved to:
- `results/inspection-results.json` - JSON format results
