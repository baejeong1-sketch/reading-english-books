@echo off
chcp 65001 >nul
echo ==========================================
echo JJ 독서 영어 웹페이지 Git 푸시 (완벽 버전)
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
    echo.
    echo 배치 파일이 프로젝트 루트 디렉토리에 있는지 확인해주세요.
    pause
    exit /b 1
)

echo ✅ 프로젝트 디렉토리를 확인했습니다.
echo.

REM 기존 .git 폴더가 있으면 삭제
if exist .git (
    echo 기존 Git 저장소를 삭제하고 재초기화합니다...
    rmdir /s /q .git
)

REM Git 초기화
echo Git 저장소를 초기화합니다...
git init
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Git 초기화 실패!
    pause
    exit /b 1
)

REM 원격 저장소 설정
echo 원격 저장소를 설정합니다...
git remote remove origin 2>nul
git remote add origin https://github.com/baejeong1-sketch/reading-english-books.git
if %ERRORLEVEL% NEQ 0 (
    echo ❌ 원격 저장소 설정 실패!
    pause
    exit /b 1
)

REM 프로젝트 파일 추가
echo.
echo 프로젝트 파일을 추가합니다...
if exist package.json git add package.json
if exist package-lock.json git add package-lock.json
if exist vite.config.js git add vite.config.js
if exist vercel.json git add vercel.json
if exist .gitignore git add .gitignore
if exist .vercelignore git add .vercelignore
if exist index.html git add index.html
if exist README.md git add README.md

REM 여러 파일 추가 (오류 무시)
for %%f in (*.md *.bat *.txt *.ps1) do (
    if exist "%%f" git add "%%f" 2>nul
)

REM 폴더 추가
if exist src (
    echo src 폴더를 추가합니다...
    git add src/
)
if exist public (
    echo public 폴더를 추가합니다...
    git add public/
)
if exist .vscode (
    echo .vscode 폴더를 추가합니다...
    git add .vscode/
)

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
    echo 1. 추가할 파일이 없습니다 (이미 커밋되어 있음)
    echo 2. 변경사항이 없습니다
    echo.
    echo 현재 상태를 확인합니다...
    git status
    echo.
    echo 수동으로 커밋하려면:
    echo   git commit -m "커밋 메시지"
    pause
    exit /b 1
)

echo ✅ 커밋이 성공적으로 완료되었습니다!
echo.

REM 브랜치 설정
git branch -M main

REM 푸시
echo ==========================================
echo GitHub에 푸시합니다...
echo ==========================================
echo.
echo ⚠️ 주의: GitHub 인증이 필요할 수 있습니다.
echo.
echo 인증 방법:
echo 1. 사용자 이름 입력 (GitHub 사용자명)
echo 2. 비밀번호 입력 (GitHub Personal Access Token)
echo.
echo Personal Access Token이 없으면:
echo 1. GitHub 접속: https://github.com/settings/tokens
echo 2. "Generate new token (classic)" 클릭
echo 3. 권한 설정: repo (전체) 체크
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
    echo 1. GitHub 인증 확인:
    echo    - Personal Access Token이 필요할 수 있습니다
    echo    - https://github.com/settings/tokens 에서 생성
    echo    - 권한: repo (전체) 체크
    echo.
    echo 2. 저장소 권한 확인:
    echo    - GitHub 저장소가 존재하는지 확인
    echo    - 저장소에 대한 쓰기 권한이 있는지 확인
    echo.
    echo 3. 네트워크 연결 확인:
    echo    - 인터넷 연결 상태 확인
    echo    - 방화벽 설정 확인
    echo.
    echo 4. 수동으로 푸시 시도:
    echo    git push -u origin main --force
    echo.
    echo 5. 저장소 URL 확인:
    git remote -v
    echo.
)
echo ==========================================
echo.
pause
