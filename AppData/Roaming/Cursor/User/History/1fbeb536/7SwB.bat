@echo off
chcp 65001 >nul
echo ==========================================
echo Git 저장소 초기화 및 Push
echo ==========================================
echo.

REM 현재 디렉토리로 이동
cd /d "%~dp0"

REM 기존 .git 폴더 삭제
if exist .git (
    echo 기존 Git 저장소를 삭제합니다...
    rmdir /s /q .git
)

REM Git 초기화
echo Git 저장소를 초기화합니다...
git init

REM 파일 추가 (프로젝트 파일만)
echo 프로젝트 파일을 추가합니다...
git add index.html
git add package.json
if exist package-lock.json git add package-lock.json
git add vite.config.js
git add .gitignore
git add .vercelignore
git add vercel.json
git add README.md
git add *.md
git add *.bat
git add *.txt
if exist src git add src/
if exist public git add public/
if exist .vscode git add .vscode/

REM Commit
echo Commit을 진행합니다...
git commit -m "Initial commit: J J 독서 영어 웹페이지 프로젝트 - 사용자 승인 시스템, 관리자 기능, 만기일 관리 포함"

REM 브랜치 이름 변경
git branch -M main

REM 원격 저장소 추가
echo 원격 저장소를 추가합니다...
git remote remove origin 2>nul
git remote add origin https://github.com/baejeong1-sketch/J-J-Reading-Books-in-English.git

REM Push (force 옵션 사용 - 빈 저장소에 처음 push할 때 필요)
echo GitHub에 Push합니다...
git push -u origin main --force

echo.
echo ==========================================
if %ERRORLEVEL% EQU 0 (
    echo Push가 성공적으로 완료되었습니다!
) else (
    echo Push 중 오류가 발생했습니다.
    echo GitHub 인증이 필요할 수 있습니다.
)
echo ==========================================
echo.
pause
