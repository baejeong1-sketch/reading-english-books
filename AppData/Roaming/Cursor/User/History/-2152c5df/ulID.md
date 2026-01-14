# 제이 제이 독서 영어

유치부 4세부터 초등학교 6학년까지를 위한 영어 독서 프로그램 웹 애플리케이션입니다.

## 주요 기능

- **사용자 가입 및 레벨 테스트**: 1-10단계 레벨 테스트를 통해 개인 맞춤 레벨 설정
- **도서 읽기**: 레벨별로 선정된 다양한 도서 (동화, 과학, 사회, 인문, 공상)
- **단어 학습**: 도서 읽기 중 단어 클릭 시 품사, 뜻, 발음 제공
- **독해 문제**: 레벨과 연령에 맞춘 5-25문제 출제 및 채점, 오답 분석 및 힌트 제공
- **발음 연습**: 소리내어 읽기 녹음 및 발음 오류 분석
- **문장 패턴 연습**: 빈칸 채우기 문제 (5-10문제)
- **쓰기 연습**: 그림과 도서 내용 기반 쓰기 문제 및 문법 교정
- **월별 테스트**: 월별 실력 향상 확인 테스트
- **다독왕 랭킹**: 매달 상위 3명에게 포인트 제공
- **사용자 기록**: 개인 학습 기록 확인
- **관리자 기능**: 모든 사용자 기록 관리 및 확인

## 기술 스택

- **프레임워크**: Next.js 14 (App Router)
- **언어**: TypeScript
- **스타일링**: Tailwind CSS
- **인증**: NextAuth.js
- **데이터베이스**: Prisma + SQLite
- **UI 컴포넌트**: Lucide React (아이콘), Framer Motion (애니메이션)

## 설치 및 실행

1. 의존성 설치:
```bash
npm install
```

2. 환경 변수 설정:
`.env` 파일을 생성하고 다음 내용을 추가하세요:
```
DATABASE_URL="file:./dev.db"
NEXTAUTH_SECRET="your-secret-key-here"
NEXTAUTH_URL="http://localhost:3000"
```

3. 데이터베이스 초기화:
```bash
npx prisma generate
npx prisma db push
```

4. 개발 서버 실행:
```bash
npm run dev
```

5. 브라우저에서 `http://localhost:3000` 접속

## 프로젝트 구조

```
├── app/                  # Next.js App Router 페이지
│   ├── api/             # API 라우트
│   ├── dashboard/       # 사용자 대시보드 및 기록
│   ├── books/           # 도서 읽기 및 학습 페이지
│   ├── admin/           # 관리자 페이지
│   └── ...
├── lib/                 # 유틸리티 함수
├── prisma/              # 데이터베이스 스키마
└── public/              # 정적 파일
```

## 주요 페이지

- `/` - 홈페이지
- `/register` - 회원가입
- `/login` - 로그인
- `/dashboard` - 사용자 대시보드
- `/level-test` - 레벨 테스트
- `/books` - 도서 목록
- `/books/[id]` - 도서 읽기
- `/books/[id]/quiz` - 독해 문제
- `/books/[id]/pronunciation` - 발음 연습
- `/books/[id]/pattern` - 문장 패턴 연습
- `/books/[id]/writing` - 쓰기 연습
- `/dashboard/leaderboard` - 다독왕 랭킹
- `/dashboard/monthly-test` - 월별 테스트
- `/dashboard/my-records` - 내 기록
- `/admin` - 관리자 페이지

## 라이선스

이 프로젝트는 교육 목적으로 제작되었습니다.
