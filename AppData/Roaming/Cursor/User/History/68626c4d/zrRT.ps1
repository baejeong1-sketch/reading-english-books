# JJ 독서 영어 웹페이지 커밋 및 푸시 스크립트
$ErrorActionPreference = "Stop"

# 프로젝트 디렉토리 경로
$projectPath = "c:\모든 파일 저장\2025년 AI 활용 충대수업\독서프로그램 4세부터 초등 6학년까지\J J 독서 영어"

Write-Host "=========================================="
Write-Host "JJ 독서 영어 웹페이지 커밋 및 푸시"
Write-Host "=========================================="
Write-Host ""

# 프로젝트 디렉토리로 이동
Set-Location $projectPath
Write-Host "현재 디렉토리: $(Get-Location)"
Write-Host ""

# Git 초기화
if (-not (Test-Path ".git")) {
    Write-Host "Git 저장소를 초기화합니다..."
    git init
}

# 원격 저장소 설정
Write-Host "원격 저장소를 설정합니다..."
git remote remove origin 2>$null
git remote add origin https://github.com/baejeong1-sketch/J-J-Reading-Books-in-English.git

# 파일 추가
Write-Host ""
Write-Host "변경된 파일을 추가합니다..."
git add .

# 커밋
Write-Host ""
Write-Host "커밋을 진행합니다..."
git commit -m "Update: JJ 독서 영어 웹페이지 - 전체 기능 구현 완료"

# 브랜치 설정
git branch -M main

# 푸시
Write-Host ""
Write-Host "=========================================="
Write-Host "GitHub에 푸시합니다..."
Write-Host "=========================================="
git push -u origin main --force

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ 커밋 및 푸시가 성공적으로 완료되었습니다!"
    Write-Host ""
    Write-Host "GitHub 저장소: https://github.com/baejeong1-sketch/J-J-Reading-Books-in-English"
    Write-Host ""
    Write-Host "이제 Vercel에서 배포할 수 있습니다!"
} else {
    Write-Host ""
    Write-Host "❌ 푸시 중 오류가 발생했습니다."
    Write-Host ""
    Write-Host "가능한 원인:"
    Write-Host "- GitHub 인증이 필요할 수 있습니다"
    Write-Host "- 저장소 권한을 확인해주세요"
}

Write-Host "=========================================="
