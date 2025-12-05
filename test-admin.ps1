Write-Host "=== ADMIN PAGE TEST ===" -ForegroundColor Cyan
Write-Host ""

# Test main website
Write-Host "1. Testing main website..." -ForegroundColor Yellow
try {
     = Invoke-WebRequest -Uri "https://d3o8vrxnvf3ttp.cloudfront.net/" -Method Head -TimeoutSec 10
    Write-Host "    Main website accessible (Status: )" -ForegroundColor Green
} catch {
    Write-Host "    Main website error: " -ForegroundColor Red
}

Write-Host ""

# Test admin page
Write-Host "2. Testing admin page..." -ForegroundColor Yellow
try {
     = Invoke-WebRequest -Uri "https://d3o8vrxnvf3ttp.cloudfront.net/admin.html" -Method Head -TimeoutSec 10
    Write-Host "    Admin page accessible (Status: )" -ForegroundColor Green
} catch {
    Write-Host "    Admin page error: " -ForegroundColor Red
}

Write-Host ""

# Test API endpoint
Write-Host "3. Testing API endpoint..." -ForegroundColor Yellow
try {
     = Invoke-WebRequest -Uri "https://5if5zp12qa.execute-api.us-east-1.amazonaws.com/prod" -Method Head -TimeoutSec 10
    Write-Host "    API Gateway accessible (Status: )" -ForegroundColor Green
} catch {
    Write-Host "     API test: " -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=== ACCESS INFORMATION ===" -ForegroundColor Green
Write-Host "Main Website: https://d3o8vrxnvf3ttp.cloudfront.net" -ForegroundColor Cyan
Write-Host "Admin Panel: https://d3o8vrxnvf3ttp.cloudfront.net/admin.html" -ForegroundColor Cyan
Write-Host "Admin Token: TravelAdmin123" -ForegroundColor Magenta
Write-Host ""
Write-Host "Note: The EC2 instance (44.220.54.91) may be stopped or not serving web content."
Write-Host "Admin dashboard is served from S3 via CloudFront." -ForegroundColor Yellow
