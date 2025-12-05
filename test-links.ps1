Write-Host "=== LINK VERIFICATION ===" -ForegroundColor Cyan
Write-Host ""

# Check README for links
Write-Host "Checking README.md for clickable links..." -ForegroundColor Yellow

 = Get-Content README.md -Raw

# Count markdown links
 = ( | Select-String '\[.*?\]\(https?://.*?\)' -AllMatches).Matches.Count
Write-Host "Found  clickable links in README" -ForegroundColor Green

# List the main links
Write-Host ""
Write-Host "=== MAIN LINKS ===" -ForegroundColor Green

 = @(
    @{Name="Main Website"; URL="https://d3o8vrxnvf3ttp.cloudfront.net"},
    @{Name="Admin Dashboard"; URL="https://d3o8vrxnvf3ttp.cloudfront.net/admin.html"},
    @{Name="API Endpoint"; URL="https://5if5zp12qa.execute-api.us-east-1.amazonaws.com/prod"},
    @{Name="GitHub Repository"; URL="https://github.com/Boat-ui/aws-newsletter-system"}
)

foreach ( in ) {
    Write-Host " : " -ForegroundColor White -NoNewline
    Write-Host .URL -ForegroundColor Cyan
}

Write-Host ""
Write-Host "=== QUICK ACCESS ===" -ForegroundColor Yellow
Write-Host "Copy and paste these URLs:" -ForegroundColor White
Write-Host ""
Write-Host "1. Website:  https://d3o8vrxnvf3ttp.cloudfront.net" -ForegroundColor Cyan
Write-Host "2. Admin:    https://d3o8vrxnvf3ttp.cloudfront.net/admin.html" -ForegroundColor Cyan
Write-Host "3. Token:    TravelAdmin123" -ForegroundColor Magenta
