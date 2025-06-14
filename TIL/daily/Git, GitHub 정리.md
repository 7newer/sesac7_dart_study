> 처음에는 도대체 '왜'하냐고 들을 것이고,
> 나중에는 도대체 '어떻게' 해낸 거냐고 물을 것이다.
---

## Git, GitHub 정리

---

### Git 생성 및 반영 순서와 명령어

1. 'git init'
  - 초기화, 로컬에 git저장소 만드는 것.
  - '.git' 폴더가 생성됨, 숨긴항목 체크해야 실제 폴더에서 보임.

2. 파일 작성 및 수정
  - git에 push 할 파일 작성 및 수정

3. 'git add .'
  - 스테이징 영역에 추가가 됨
  - 스테이징 영역: 커밋 되기전 작성,수정 된 파일을 보관하는 임시 저장 공간

4. 'git status'
  - 스테이징 영역에 파일 확인 (Untracked files, committed)
  - 파일이 추가 되지 않은 경우
    Untracked files:  
    (use "git add <file>..." to include in what will be committed)
    sample.txt
  - 파일이 추가 된 경우
    Changes to be committed:
    (use "git rm --cached <file>..." to unstage)
    new file:   sample.txt

5. 'git commit -m "메세지"'
  - git 로컬 저장소에 저장하는것 
  - m: Message
  - "메세지" 는 **Git Commit Message Convention Guide**를 사용해 작성하자

6. Github 저장소 생성
  - [GitHub](https://github.com/)
  - 새로운 원격저장소 생성하기

7. 'git remote add origin URL' 또는 SSH
  - 로컬 저장소와 원격저장소(GitHub) 연결
  - orgin은 원격저장소 별칭
  - **SSH**

8. 'git push -u origin master'
  - 커밋된 내용을 원격저장소 반영
  - master(로컬)에서 orgin(원격)으로 push
  - master가 main인 경우도 있음
---

### Git Commit Message Convention Guide

1. 'feat': 새로운 기능 추가
2. 'fix': 버그 픽스
3. 'docs': 문서 수정
4. 'style': 포맷,세미콜론 수정,Optimize import, Code clean up등 코드가 아닌 스타일에 관련된 수정
5. 'refactor': 코드 리펙토링
6. 'test': 테스트 코드 추가
7. 'chore': 빌드관련 업무수정(안드로이드의 경우 builde.gradle, manifest)
예시) git commit -m "chore: README.md 수정"

---

### SSH 생성 및 연결
**SSH는 GitHub 연결하기 위한 안정 인증키**
**HTTP대신 SSH로하면 매번 로그인 비밀번호 입력없이 Push 가능하다.**

1. ssh-keygen
  - git bash에서 할것
  - 비밀번호 설정하지 않는다면 Enter

2. cd ~/.ssh/
  - .ssh로 이동

3. 두개의 키 파일이 생겼는지 확인
  - 예) 
  - id_ed25519.pub (공개키)
  - id_ed25519 (비공개키) 외부 유출하면 안됨!

4. cat id_ed25519.pub
  - 출력된 공개키 내용을 복사하기

5. GitHub에서 SSH키 만들기
  - 자신아이콘 → 설정 → SSH and GPG key 선택 → New SSH key 버튼 클릭
  - Title: 키 제목
  - Key: 복사한 키 내용 붙여넣기

6. git remote add origin ssh
  - 로컬 저장소와 원격저장소(GitHub) 연결

---

### HTTP를 SSH로 수정하기
**만약 전에 HTTP로 연결이 되어 있는상태에서 SSH로 변경하려면**

1. git remote -v
  - 연결되어 있는 github 표시
  - 출력 예시)
  - origin  'git@github.com:xxx/yyy.git' (fetch)
  - origin  'git@github.com:xxx/yyy.git' (push)

2. git remote remove origin
  - 연결 삭제

3. git remote add origin Github의 ssh주소
  - 로컬 저장소와 원격저장소(GitHub) SSH로 연결
  - 예시) 'git remote add origin git@github.com:username/repo.git'

---

### .gitignore 파일
**github에 공개 또는 올리면 안되면 파일을 작성(예를들어 .env, log 등등)**

예시)
1. 'echo ".env" > .gitignore'
  - .gitignore 파일에 덮어쓰기

2. 'echo ".env" >> .gitignore'
  - .gitignore 파일에 추가하기, append개념

3. 'git add .'

4. 'git commit -m "chore: .gitignore 추가"'

---

### GitHub 제출 순서
**Fork, Clone, Pull Request**
**오픈 소스 활동**

1. fork
  - 다른 사람의 Github 원격저장소를 내 GitHub 원격저장소로 복사하는 것
  - Github에서 Fork 아이콘 클릭
  - fork 된 것은 내 것임

2. 'git clone git@github.com:xxx/yyyy.git'
  - clone: 내 로컬 컴퓨터로 가져옴, 복사
  - 안드로이드 스튜디오 Git(Alt+9): git 로그 확인 가능

3. 작성 및 수정, commit, push

4. PR(Pull Request)
  - 수정된것을 원본에 반영 요청
  - 중요사항! 스터디중 꼭 본인 브랜치에 PR 할 것!

### Git 이름과 이메일을 Git에 등록
  - git config --global user.name "이름"
  - git config --global user.email "이메일주소@example.com"
