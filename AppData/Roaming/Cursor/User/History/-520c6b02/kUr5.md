# 🚀 실행 방법 - 간단 가이드

## ⚠️ Live Server로는 실행할 수 없습니다!

이 프로젝트는 **React + Vite**로 만들어졌습니다.
`index.html`을 Live Server로 열면 하얀 화면만 보입니다.

## ✅ 올바른 실행 방법

### 🎯 방법 1: VS Code에서 F5 키 (가장 쉬운 방법!)

1. VS Code에서 프로젝트 폴더 열기
2. **F5 키**를 누르기
3. "Vite 개발 서버 시작" 선택
4. 완료! 브라우저가 자동으로 열립니다 ✨

### 🎯 방법 2: 배치 파일 사용

1. **INSTALL.bat** 더블클릭 (처음 한 번만)
2. **START.bat** 더블클릭
3. 브라우저가 자동으로 열립니다!

### 🎯 방법 3: 터미널 사용

```bash
npm install    # 처음 한 번만
npm run dev    # 개발 서버 시작
```

## 📍 접속 주소

- **http://localhost:3000**
- 개발 서버가 시작되면 자동으로 브라우저가 열립니다

## 🔧 문제 해결

### Node.js가 없을 때
- https://nodejs.org/ 에서 설치
- 설치 후 VS Code 재시작

### F5가 작동하지 않을 때
- VS Code에서 `Ctrl+Shift+P`
- "Tasks: Run Task" 입력
- "npm: dev" 선택

### 포트 3000이 사용 중일 때
- `vite.config.js`에서 포트 번호 변경

## 💡 왜 Live Server로 안 되나요?

- React는 JSX를 JavaScript로 변환해야 합니다
- Vite가 이 변환 작업을 해줍니다
- Live Server는 단순 정적 파일만 서빙합니다
- 따라서 **Vite 개발 서버**가 필요합니다

## ✨ VS Code 단축키

- **F5**: 개발 서버 시작
- **Ctrl+~**: 터미널 열기
- **Ctrl+Shift+P**: 명령 팔레트
