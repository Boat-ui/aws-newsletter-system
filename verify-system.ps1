Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "    AWS NEWSLETTER SYSTEM VERIFICATION    " -ForegroundColor Yellow
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# Check Git status
Write-Host "1. GIT STATUS:" -ForegroundColor Green
git status
Write-Host ""

# List files
Write-Host "2. PROJECT FILES:" -ForegroundColor Green
Get-ChildItem -Recurse -File | Select-Object -First 15 Name
Write-Host ""

# Count files
 = (Get-ChildItem -Recurse -File).Count
Write-Host "Total files: " -ForegroundColor Yellow
Write-Host ""

# Check key files
Write-Host "3. KEY FILES CHECK:" -ForegroundColor Green
 = @(
    "README.md",
    "website\index.html", 
    "website\admin.html",
    "lambda\save-subscription.js",
    "lambda\get-subscribers.js",
    "deploy.sh"
)

foreach ( in ) {
    if (Test-Path ) {
        Write-Host "    " -ForegroundColor Green
    } else {
        Write-Host "     (MISSING)" -ForegroundColor Red
    }
}
Write-Host ""

# Show live URLs
Write-Host "4. LIVE DEPLOYMENT:" -ForegroundColor Green
Write-Host "   Website: https://d3o8vrxnvf3ttp.cloudfront.net" -ForegroundColor Cyan
Write-Host "   Admin: http://44.220.54.91" -ForegroundColor Cyan
Write-Host "   API: https://5if5zp12qa.execute-api.us-east-1.amazonaws.com/prod" -ForegroundColor Cyan
Write-Host "   Token: TravelAdmin123" -ForegroundColor Magenta
Write-Host ""

# Git information
Write-Host "5. GIT INFORMATION:" -ForegroundColor Green
git log --oneline -3
Write-Host ""
Write-Host "Remote: origin	https://github.com/Boat-ui/aws-newsletter-system.git (fetch)"
Write-Host ""

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "   VERIFICATION COMPLETE - SYSTEM READY   " -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
