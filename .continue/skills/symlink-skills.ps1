# 1. Define the source (your repo's skills folder)
$RepoSkillsDir = Join-Path (Get-Location) ".skills"

# 2. Define the target directories for each IDE
$TargetPaths = @(
    ".claude\skills",      # Claude Code
    ".cursor\skills",      # Cursor
    ".continue\skills",    # Continue
    ".copilot\skills"      # VS Code Copilot
)

# 3. Ensure the source folder exists
if (-not (Test-Path $RepoSkillsDir)) {
    New-Item -ItemType Directory -Path $RepoSkillsDir -Force
    Write-Host "Created source folder: $RepoSkillsDir" -ForegroundColor Cyan
}

# 4. Loop through targets and create Junctions
foreach ($Path in $TargetPaths) {
    # Ensure the parent directory (e.g., ~/.claude) exists
    $ParentDir = Split-Path -Path $Path -Parent
    if (-not (Test-Path $ParentDir)) {
        New-Item -ItemType Directory -Path $ParentDir -Force
    }

    # Clean up existing folder/link to avoid "File already exists" errors
    if (Test-Path $Path) {
        Write-Host "Removing existing path at $Path..." -ForegroundColor Yellow
        Remove-Item -Path $Path -Recurse -Force
    }

    # Create the Junction point
    # Junctions are essentially hard links for directories
    New-Item -ItemType Junction -Path $Path -Target $RepoSkillsDir -Force
    
    Write-Host "Junction Created: $Path -> $RepoSkillsDir" -ForegroundColor Green
}

Write-Host "`nAll set! Your meal-planning skills are now synced across all IDEs." -ForegroundColor Cyan
