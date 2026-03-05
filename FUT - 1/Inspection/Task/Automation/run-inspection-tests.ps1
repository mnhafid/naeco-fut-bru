# Inspection Automation Test Runner (PowerShell)
# This script runs the Inspection API automation tests using Bruno CLI

param(
    [string]$Environment = "DEV",
    [switch]$Help
)

if ($Help) {
    Write-Host "Usage: .\run-inspection-tests.ps1 [-Environment <env_name>]"
    Write-Host ""
    Write-Host "Options:"
    Write-Host "  -Environment   Specify the environment to use (default: DEV)"
    Write-Host "  -Help          Show this help message"
    Write-Host ""
    Write-Host "Examples:"
    Write-Host "  .\run-inspection-tests.ps1              # Run with DEV environment"
    Write-Host "  .\run-inspection-tests.ps1 -Environment TEST  # Run with TEST environment"
    exit 0
}

$COLLECTION_PATH = "FUT - 1"
$AUTOMATION_FOLDER = "Inspection/Task/Automation"

Write-Host "========================================" -ForegroundColor Yellow
Write-Host "  Inspection API Automation Test Suite" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Yellow
Write-Host ""

# Check if Bruno CLI is installed
try {
    $bruVersion = bru --version 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "Bruno CLI not found"
    }
    Write-Host "Bruno CLI Version: $bruVersion" -ForegroundColor Green
} catch {
    Write-Host "Error: Bruno CLI (bru) is not installed." -ForegroundColor Red
    Write-Host "Please install it first:"
    Write-Host "  npm install -g @usebruno/cli"
    exit 1
}

# Run the automation tests
Write-Host "Running Inspection Automation Tests..." -ForegroundColor Yellow
Write-Host ""

# Execute the automation folder tests
$result = bru run `
    --collection "$COLLECTION_PATH" `
    --folder "$AUTOMATION_FOLDER" `
    --environment $Environment `
    --output "results/inspection-results.json" `
    --format json

# Check exit code
if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  All Inspection Tests Passed!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    exit 0
} else {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "  Inspection Tests Failed!" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    exit 1
}
