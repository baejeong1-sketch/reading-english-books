@echo off
chcp 65001 >nul
echo ==========================================
echo Git 저장소 정리 및 푸시 (완전 수정 버전)
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

REM 기존 .git 폴더가 있으면 삭제
if exist .git (
    echo 기존 Git 저장소를 삭제하고 재초기화합니다...
    rmdir /s /q .git
)

REM Git 초기화
echo Git 저장소를 초기화합니다...
git init

REM 원격 저장소 설정
echo 원격 저장소를 설정합니다...
git remote remove origin 2>nul
git remote add origin https://github.com/baejeong1-sketch/reading-english-books.git

REM 프로젝트 파일만 선택적으로 추가
echo.
echo 프로젝트 파일을 추가합니다...
git add package.json
if exist package-lock.json git add package-lock.json
git add vite.config.js
if exist vercel.json git add vercel.json
if exist .gitignore git add .gitignore
if exist .vercelignore git add .vercelignore
if exist index.html git add index.html
if exist README.md git add README.md
git add *.md 2>nul
git add *.bat 2>nul
git add *.txt 2>nul
git add *.ps1 2>nul

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

REM 커밋
echo.
echo 커밋을 진행합니다...
git commit -m "Initial commit: JJ 독서 영어 웹페이지 - 전체 기능 구현 완료"

if %ERRORLEVEL% NEQ 0 (
    echo ❌ 커밋 실패: 변경사항이 없거나 오류가 발생했습니다.
    echo.
    echo 현재 상태를 확인합니다...
    git status
    pause
    exit /b 1
)

REM 브랜치 설정
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
    echo.
    echo Vercel 배포 방법:
    echo 1. https://vercel.com 접속
    echo 2. GitHub 계정으로 로그인
    echo 3. "Add New Project" 클릭
    echo 4. 위 저장소를 선택하고 "Import" 클릭
    echo 5. 자동으로 배포가 시작됩니다!
) else (
    echo ❌ 푸시 중 오류가 발생했습니다.
    echo.
    echo 가능한 원인:
    echo - GitHub 인증이 필요할 수 있습니다
    echo - 저장소 권한을 확인해주세요
    echo - 네트워크 연결을 확인해주세요
    echo.
    echo 수동으로 푸시하려면:
    echo   git push -u origin main --force
    echo.
    echo GitHub 인증이 필요하면:
    echo 1. GitHub에서 Personal Access Token 생성
    echo 2. 비밀번호 대신 토큰 사용
)
echo ==========================================
echo.
pause
