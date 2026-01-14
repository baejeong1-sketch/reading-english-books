@echo off
chcp 65001 >nul
echo ==========================================
echo Git 저장소 초기화 및 Commit
echo ==========================================
echo.

REM 현재 디렉토리 확인
cd /d "%~dp0"

REM 기존 .git 폴더 삭제
if exist .git (
    echo 기존 Git 저장소를 삭제합니다...
    rmdir /s /q .git
)

REM Git 초기화
echo Git 저장소를 초기화합니다...
git init

REM 파일 추가
echo 파일을 추가합니다...
git add .

REM Commit
echo Commit을 진행합니다...
git commit -m "Initial commit: J J 독서 영어 웹페이지 프로젝트 - 사용자 승인 시스템, 관리자 기능, 만기일 관리 포함"

echo.
echo ==========================================
echo 완료되었습니다!
echo ==========================================
echo.
echo 원격 저장소를 추가하려면:
echo   git remote add origin [저장소 URL]
echo   git push -u origin main
echo.
pause
