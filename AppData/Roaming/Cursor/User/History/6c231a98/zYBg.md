# 🚀 Vercel 배포 가이드

## Vercel이란?

Vercel은 프론트엔드 프로젝트를 쉽게 배포할 수 있는 플랫폼입니다.
React, Vue, Next.js 등 다양한 프레임워크를 지원하며, GitHub와 연동하여 자동 배포가 가능합니다.

## 배포 방법

### 방법 1: Vercel 웹사이트에서 배포 (가장 쉬운 방법) ⭐

1. **Vercel 가입**
   - https://vercel.com 접속
   - GitHub 계정으로 로그인

2. **프로젝트 가져오기**
   - "Add New..." → "Project" 클릭
   - GitHub 저장소 선택: `baejeong1-sketch/J-J-Reading-Books-in-English`
   - "Import" 클릭

3. **설정 확인**
   - Framework Preset: **Vite** (자동 감지됨)
   - Root Directory: `./` (기본값)
   - Build Command: `npm run build` (자동 설정됨)
   - Output Directory: `dist` (자동 설정됨)

4. **배포**
   - "Deploy" 버튼 클릭
   - 몇 분 후 배포 완료!

5. **배포 URL 확인**
   - 배포가 완료되면 자동으로 URL이 생성됩니다
   - 예: `https://j-j-reading-books-in-english.vercel.app`

### 방법 2: Vercel CLI 사용

1. **Vercel CLI 설치**
   ```bash
   npm install -g vercel
   ```

2. **로그인**
   ```bash
   vercel login
   ```

3. **배포**
   ```bash
   vercel
   ```

4. **프로덕션 배포**
   ```bash
   vercel --prod
   ```

## 자동 배포 설정

GitHub에 코드를 push하면 자동으로 Vercel에서 재배포됩니다!

1. GitHub에 코드 push
2. Vercel이 자동으로 변경사항 감지
3. 자동으로 빌드 및 배포 진행
4. 배포 완료 알림

## 환경 변수 설정 (필요한 경우)

Vercel 대시보드에서:
1. 프로젝트 선택
2. Settings → Environment Variables
3. 필요한 환경 변수 추가

## 커스텀 도메인 설정

1. Vercel 대시보드에서 프로젝트 선택
2. Settings → Domains
3. 도메인 추가

## 배포 확인

배포가 완료되면:
- ✅ 자동으로 HTTPS 적용
- ✅ 전 세계 CDN으로 빠른 속도
- ✅ 자동 스케일링
- ✅ 무료 호스팅 (개인 프로젝트)

## 문제 해결

### 빌드 오류가 발생하는 경우
- `package.json`의 빌드 스크립트 확인
- `vercel.json` 설정 확인
- Vercel 로그에서 오류 메시지 확인

### 환경 변수가 필요한 경우
- Vercel 대시보드에서 Environment Variables 설정

## 참고 링크

- Vercel 공식 문서: https://vercel.com/docs
- Vite 배포 가이드: https://vitejs.dev/guide/static-deploy.html#vercel
