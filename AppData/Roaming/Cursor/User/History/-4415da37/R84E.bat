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

REM Git 초기화 (이미 있으면 스킵)
if not exist .git (
    echo Git 저장소를 초기화합니다...
    git init
)

REM 원격 저장소 확인 및 추가
git remote remove origin 2>nul
git remote add origin https://github.com/baejeong1-sketch/reading-english-books.git

REM 모든 프로젝트 파일 추가
echo.
echo 변경된 파일을 추가합니다...
git add .

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
    echo GitHub 저장소: https://github.com/baejeong1-sketch/J-J-Reading-Books-in-English
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
