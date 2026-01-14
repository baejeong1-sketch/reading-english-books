@echo off
chcp 65001 >nul
echo ==========================================
echo J J 독서 영어 - 의존성 설치
echo ==========================================
echo.

REM 현재 디렉토리 확인
cd /d "%~dp0"

echo Node.js 버전 확인 중...
node --version
if errorlevel 1 (
    echo.
    echo 오류: Node.js가 설치되어 있지 않습니다!
    echo.
    echo Node.js를 설치하세요: https://nodejs.org/
    echo 설치 후 이 파일을 다시 실행하세요.
    pause
    exit /b 1
)

echo.
echo npm 버전 확인 중...
npm --version
if errorlevel 1 (
    echo.
    echo 오류: npm이 설치되어 있지 않습니다!
    pause
    exit /b 1
)

echo.
echo 의존성을 설치하고 있습니다...
echo 이 작업은 몇 분이 걸릴 수 있습니다...
echo.

call npm install

if errorlevel 1 (
    echo.
    echo 오류: 의존성 설치에 실패했습니다.
    pause
    exit /b 1
)

echo.
echo ==========================================
echo 설치가 완료되었습니다!
echo ==========================================
echo.
echo 이제 START.bat 파일을 실행하여 개발 서버를 시작할 수 있습니다.
echo.
pause
