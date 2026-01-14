@echo off
chcp 65001 >nul
echo ==========================================
echo Git 저장소 초기화 및 Push (수정 버전)
echo ==========================================
echo.

REM 현재 스크립트가 있는 디렉토리로 이동
cd /d "%~dp0"

REM 현재 디렉토리 확인
echo 현재 디렉토리: %CD%
echo.

REM 기존 .git 폴더 삭제
if exist .git (
    echo 기존 Git 저장소를 삭제합니다...
    rmdir /s /q .git
)

REM Git 초기화
echo Git 저장소를 초기화합니다...
git init

REM 프로젝트 파일만 선택적으로 추가
echo 프로젝트 파일을 추가합니다...
git add index.html
git add package.json
git add package-lock.json
git add vite.config.js
git add .gitignore
git add .vercelignore
git add vercel.json
git add README.md
git add *.md
git add *.bat
git add *.txt

REM src 폴더 추가
if exist src (
    echo src 폴더를 추가합니다...
    git add src/
)

REM public 폴더 추가
if exist public (
    echo public 폴더를 추가합니다...
    git add public/
)

REM .vscode 폴더 추가 (선택적)
if exist .vscode (
    echo .vscode 폴더를 추가합니다...
    git add .vscode/
)

REM Commit
echo.
echo Commit을 진행합니다...
git commit -m "Initial commit: J J 독서 영어 웹페이지 프로젝트 - 사용자 승인 시스템, 관리자 기능, 만기일 관리 포함"

REM 브랜치 이름 확인 및 변경
echo.
echo 브랜치를 main으로 설정합니다...
git branch -M main

REM 원격 저장소 확인 및 추가
echo.
echo 원격 저장소를 확인합니다...
git remote remove origin 2>nul
git remote add origin https://github.com/baejeong1-sketch/J-J-Reading-Books-in-English.git

REM 원격 저장소 확인
git remote -v

REM Push
echo.
echo ==========================================
echo GitHub에 Push합니다...
echo ==========================================
git push -u origin main --force

echo.
echo ==========================================
if %ERRORLEVEL% EQU 0 (
    echo ✅ Push가 성공적으로 완료되었습니다!
    echo.
    echo 이제 Vercel에서 배포할 수 있습니다:
    echo 1. https://vercel.com 접속
    echo 2. GitHub 저장소 선택
    echo 3. Deploy 클릭
) else (
    echo ❌ Push 중 오류가 발생했습니다.
    echo.
    echo 가능한 원인:
    echo - GitHub 인증이 필요할 수 있습니다
    echo - 저장소 권한을 확인해주세요
    echo.
    echo 수동으로 push하려면:
    echo   git push -u origin main --force
)
echo ==========================================
echo.
pause
