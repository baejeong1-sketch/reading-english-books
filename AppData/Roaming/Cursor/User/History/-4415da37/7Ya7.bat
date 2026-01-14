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

REM 추가된 파일 확인
echo.
echo 추가된 파일을 확인합니다...
git status --short
echo.

REM 커밋
echo ==========================================
echo 커밋을 진행합니다...
echo ==========================================
git commit -m "Initial commit: JJ 독서 영어 웹페이지 - 전체 기능 구현 완료"

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ❌ 커밋 실패!
    echo.
    echo 가능한 원인:
    echo 1. 추가할 파일이 없습니다 (변경사항 없음)
    echo 2. 이미 커밋되어 있습니다
    echo.
    echo 현재 상태를 확인합니다...
    git status
    pause
    exit /b 1
)

echo ✅ 커밋이 성공적으로 완료되었습니다!
echo.

REM 브랜치 확인 및 설정
git branch -M main

REM 푸시
echo ==========================================
echo GitHub에 푸시합니다...
echo ==========================================
echo.
echo ⚠️ 주의: GitHub 인증이 필요할 수 있습니다.
echo.
echo Personal Access Token이 필요하면:
echo 1. https://github.com/settings/tokens 접속
echo 2. "Generate new token (classic)" 클릭
echo 3. 권한: repo (전체) 체크
echo 4. 생성된 토큰을 비밀번호로 사용
echo.
echo 푸시를 시작합니다...
echo.

git push -u origin main --force

echo.
echo ==========================================
if %ERRORLEVEL% EQU 0 (
    echo ✅ 커밋 및 푸시가 성공적으로 완료되었습니다!
    echo.
    echo GitHub 저장소: 
    echo https://github.com/baejeong1-sketch/reading-english-books
    echo.
    echo ==========================================
    echo Vercel 배포 방법:
    echo ==========================================
    echo 1. https://vercel.com 접속
    echo 2. GitHub 계정으로 로그인
    echo 3. "Add New Project" 클릭
    echo 4. "reading-english-books" 저장소 선택
    echo 5. "Import" 클릭
    echo 6. 자동으로 배포가 시작됩니다!
    echo.
) else (
    echo ❌ 푸시 중 오류가 발생했습니다.
    echo.
    echo ==========================================
    echo 문제 해결 방법:
    echo ==========================================
    echo.
    echo 1. GitHub Personal Access Token 생성:
    echo    - https://github.com/settings/tokens
    echo    - "Generate new token (classic)"
    echo    - 권한: repo (전체) 체크
    echo    - 생성된 토큰 복사
    echo.
    echo 2. 푸시 시 사용:
    echo    - 사용자 이름: GitHub 사용자명
    echo    - 비밀번호: 위에서 생성한 토큰
    echo.
    echo 3. 저장소 확인:
    git remote -v
    echo.
    echo 4. 수동 푸시:
    echo    git push -u origin main --force
    echo.
)
echo ==========================================
echo.
pause
