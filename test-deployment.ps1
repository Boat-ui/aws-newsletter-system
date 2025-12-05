Write-Host "Testing AWS Newsletter System Deployment..." -ForegroundColor Yellow
Write-Host ""

# Test S3 access
Write-Host "1. Testing S3 bucket access..." -ForegroundColor Cyan
try {
     = aws s3 ls s3://website-boat/ 2>&1
    if (0 -eq 0) {
        Write-Host "    S3 bucket accessible" -ForegroundColor Green
    } else {
        Write-Host "     S3 check failed: " -ForegroundColor Yellow
    }
} catch {
    Write-Host "    S3 test error" -ForegroundColor Red
}

Write-Host ""

# Test CloudFront
Write-Host "2. Testing CloudFront distribution..." -ForegroundColor Cyan
try {
     = aws cloudfront get-distribution --id d3o8vrxnvf3ttp --query "Distribution.Status" 2>&1
    if (0 -eq 0) {
        Write-Host "    CloudFront distribution active: " -ForegroundColor Green
    } else {
        Write-Host "     CloudFront check failed" -ForegroundColor Yellow
    }
} catch {
    Write-Host "    CloudFront test error" -ForegroundColor Red
}

Write-Host ""

# Show final status
Write-Host "=== SYSTEM STATUS ===" -ForegroundColor Green
Write-Host "All systems should be operational at:" -ForegroundColor White
Write-Host " https://d3o8vrxnvf3ttp.cloudfront.net" -ForegroundColor Cyan
Write-Host " http://44.220.54.91" -ForegroundColor Cyan
Write-Host ""
Write-Host "To deploy updates, run: .\deploy.sh" -ForegroundColor Yellow
