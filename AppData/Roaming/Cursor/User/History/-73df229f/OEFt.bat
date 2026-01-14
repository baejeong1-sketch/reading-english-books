@echo off
chcp 65001 >nul
echo ==========================================
echo J J 독서 영어 - 개발 서버 시작
echo ==========================================
echo.

REM 현재 디렉토리 확인
cd /d "%~dp0"

REM node_modules 확인
if not exist "node_modules" (
    echo 의존성을 설치하고 있습니다...
    call npm install
    if errorlevel 1 (
        echo.
        echo 오류: 의존성 설치에 실패했습니다.
        echo Node.js가 설치되어 있는지 확인하세요.
        pause
        exit /b 1
    )
    echo.
)

REM 개발 서버 시작
echo 개발 서버를 시작합니다...
echo 브라우저가 자동으로 열립니다.
echo.
echo 서버를 중지하려면 Ctrl+C를 누르세요.
echo.
call npm run dev

pause
