Write-Host '=== AWS Newsletter System Verification ===' -ForegroundColor Green
Write-Host "Repository: https://github.com/Boat-ui/aws-newsletter-system"
Write-Host ''
Write-Host '=== Local Files ===' -ForegroundColor Yellow
Get-ChildItem -Recurse -File | Select-Object -First 10 Name
Write-Host ''
Write-Host '=== Git Status ===' -ForegroundColor Yellow
git status
Write-Host ''
Write-Host '=== Live URLs ===' -ForegroundColor Cyan
Write-Host "Website: https://d3o8vrxnvf3ttp.cloudfront.net"
Write-Host "Admin: http://44.220.54.91"
Write-Host "Admin Token: TravelAdmin123"
