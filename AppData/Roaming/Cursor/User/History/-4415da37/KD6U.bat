@echo off
chcp 65001 >nul
echo ==========================================
echo JJ 독서 영어 웹페이지 커밋 및 푸시
echo ==========================================
echo.

REM 현재 스크립트가 있는 디렉토리로 이동
cd /d "%~dp0"

echo 현재 디렉토리: %CD%
echo.

REM package.json이 있는지 확인 (프로젝트 디렉토리 확인)
if not exist package.json (
    echo ❌ 오류: package.json을 찾을 수 없습니다!
    echo 현재 디렉토리가 프로젝트 디렉토리가 아닙니다.
    pause
    exit /b 1
)

REM 기존 .git 폴더가 있으면 삭제 (잘못된 위치에 있을 수 있음)
if exist .git (
    echo 기존 Git 저장소를 삭제하고 재초기화합니다...
    rmdir /s /q .git
)

REM Git 초기화
echo Git 저장소를 초기화합니다...
git init

REM 원격 저장소 확인 및 추가
echo 원격 저장소를 설정합니다...
git remote remove origin 2>nul
git remote add origin https://github.com/baejeong1-sketch/reading-english-books.git

REM 프로젝트 파일만 선택적으로 추가 (.gitignore 준수)
echo.
echo 프로젝트 파일을 추가합니다...
git add package.json
git add package-lock.json
git add vite.config.js
git add vercel.json
git add .gitignore
if exist .vercelignore git add .vercelignore
git add index.html
git add README.md
git add *.md
git add *.bat
git add *.txt
git add *.ps1
if exist src git add src/
if exist public git add public/
if exist .vscode git add .vscode/

REM 커밋
echo.
echo 커밋을 진행합니다...
git commit -m "Update: JJ 독서 영어 웹페이지 - 전체 기능 구현 완료"

REM 브랜치 확인 및 설정
git branch -M main

REM 푸시
echo.
echo ==========================================
echo GitHub에 푸시합니다...
echo ==========================================
git push -u origin main --force

echo.
echo ==========================================
if %ERRORLEVEL% EQU 0 (
    echo ✅ 커밋 및 푸시가 성공적으로 완료되었습니다!
    echo.
    echo GitHub 저장소: https://github.com/baejeong1-sketch/reading-english-books
    echo.
    echo 이제 Vercel에서 배포할 수 있습니다!
) else (
    echo ❌ 푸시 중 오류가 발생했습니다.
    echo.
    echo 가능한 원인:
    echo - GitHub 인증이 필요할 수 있습니다
    echo - 저장소 권한을 확인해주세요
    echo.
    echo 수동으로 푸시하려면:
    echo   git push -u origin main --force
)
echo ==========================================
echo.
pause
