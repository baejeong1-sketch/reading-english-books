# Vercel 배포 오류 해결 가이드

## 오류: "The provided GitHub repository does not contain the requested branch or commit reference"

이 오류는 **GitHub 저장소가 비어있거나 main 브랜치에 커밋이 없을 때** 발생합니다.

## 해결 방법

### 1단계: GitHub에 코드 Push

먼저 GitHub 저장소에 코드를 push해야 합니다.

#### 방법 A: 배치 파일 사용 (추천)

1. **GIT_PUSH.bat** 파일을 더블클릭
2. 자동으로 Git 초기화, 커밋, push가 진행됩니다
3. 완료 메시지 확인

#### 방법 B: 수동으로 Push

```bash
# 1. Git 초기화 (프로젝트 디렉토리에서)
git init

# 2. 파일 추가
git add index.html package.json vite.config.js .gitignore vercel.json
git add src/ public/ README.md *.md

# 3. 커밋
git commit -m "Initial commit: J J 독서 영어 웹페이지"

# 4. 브랜치 이름 설정
git branch -M main

# 5. 원격 저장소 추가
git remote add origin https://github.com/baejeong1-sketch/J-J-Reading-Books-in-English.git

# 6. Push
git push -u origin main --force
```

### 2단계: GitHub 저장소 확인

1. https://github.com/baejeong1-sketch/J-J-Reading-Books-in-English 접속
2. 파일들이 보이는지 확인
3. `main` 브랜치가 있는지 확인

### 3단계: Vercel에서 다시 배포

1. Vercel 대시보드로 이동
2. 프로젝트를 다시 Import하거나
3. 기존 프로젝트에서 "Redeploy" 클릭

## 문제가 계속되는 경우

### 저장소가 비어있는지 확인

GitHub 저장소 페이지에서:
- 파일 목록이 보이는지 확인
- `main` 브랜치가 있는지 확인
- README.md 파일이 있는지 확인

### Git 상태 확인

프로젝트 디렉토리에서:
```bash
git status
git log --oneline
git branch -a
```

### 수동으로 파일 확인

GitHub 저장소에 다음 파일들이 있어야 합니다:
- ✅ `package.json`
- ✅ `vite.config.js`
- ✅ `index.html`
- ✅ `src/` 폴더
- ✅ `README.md`

## 빠른 해결 체크리스트

- [ ] GIT_PUSH.bat 실행 완료
- [ ] GitHub 저장소에 파일이 보임
- [ ] main 브랜치가 존재함
- [ ] 최소 1개 이상의 커밋이 있음
- [ ] Vercel에서 저장소를 다시 Import

## 추가 도움말

문제가 해결되지 않으면:
1. GitHub 저장소를 삭제하고 새로 만들기
2. 또는 Vercel CLI를 사용하여 배포:
   ```bash
   npm install -g vercel
   vercel login
   vercel
   ```
