# 🚀 빠른 시작 가이드

## ⚠️ 중요: Live Server로는 실행할 수 없습니다!

이 프로젝트는 **React + Vite**로 만들어졌습니다.
Live Server로 `index.html`을 열면 하얀 화면만 보입니다.

## ✅ 올바른 실행 방법

### 방법 1: 배치 파일 사용 (가장 쉬운 방법) ⭐

1. **INSTALL.bat** 더블클릭 (처음 한 번만)
2. **START.bat** 더블클릭
3. 브라우저가 자동으로 열립니다!

### 방법 2: VS Code에서 실행

1. **F5 키**를 누르거나
2. **실행 및 디버그** 메뉴에서 "Vite 개발 서버 시작" 선택
3. 또는 터미널에서 `npm run dev` 실행

### 방법 3: 터미널에서 실행

```bash
# 1. 의존성 설치 (처음 한 번만)
npm install

# 2. 개발 서버 시작
npm run dev
```

## 📍 접속 주소

개발 서버가 시작되면:
- **자동으로 브라우저가 열립니다**
- 또는 수동으로 **http://localhost:3000** 접속

## 🔧 문제 해결

### Node.js가 없을 때
- https://nodejs.org/ 에서 Node.js 설치
- 설치 후 터미널을 다시 시작

### 포트 3000이 사용 중일 때
- `vite.config.js` 파일에서 포트 번호 변경 가능

### 의존성 설치 오류
- `node_modules` 폴더 삭제
- `npm install` 다시 실행

## 📝 참고

- 서버 중지: 터미널에서 `Ctrl + C`
- 빌드: `npm run build` (정적 파일 생성)
