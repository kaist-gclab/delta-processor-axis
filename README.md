# delta-processor-axis &middot; [![GitHub license](https://img.shields.io/github/license/kaist-gclab/delta-processor-axis)](https://github.com/kaist-gclab/delta-processor-axis/blob/main/LICENSE)

SW스타랩 &lt;3차원 기하 모델 프로세싱 프레임워크 개발&gt; 미디얼 액시스 근사 계산 노드

## 설명

원본 매쉬 혹은 샘플 정점들로부터 [미디얼 액시스](https://en.wikipedia.org/wiki/Medial_axis)를 계산하는 모듈입니다.  
[N. Amenta, S. Choi and R. Kolluri, The Power Crust](http://www.cs.ucdavis.edu/~amenta/powercrust.html) 논문을 기반으로 구현되었습니다.


<img src="assets/overview.png" width="350">


## 실행 방법

모듈을 실행은 크게 1) 이미지 빌드 작업과 2) 컨테이너 실행 작업으로 나뉘어집니다.

**이미지 빌드**:
```bash
# `delta-processor-axis`라는 태그로 해당 레포지토리를 Docker 이미지로 빌드합니다.
$ docker build -t delta-processor-axis .
```

**컨테이너 실행**:
```bash
# Docker 컨테이너를 실행합니다.
$ docker run --rm \
    -v /path/to/local/dir:/data \
    delta-processor-axis \
    [ARGUMENTS] INPUT_FILE_NAME

# 아래는 예제 스크립트입니다.
$ docker run --rm \
    -v /home/ubuntu/horse-model:/data \
    delta-processor-axis \
    -m 100000 -i horse.off
```

- `--rm` 옵션은 컨테이너가 실행된 이후 자동으로 컨테이너를 삭제하는 옵션입니다.
    - 지정해주지 않아도 실행에 문제가 없으나, 불필요한 컨테이너가 쌓이는 것을 방지하기 위해 권장하는 옵션입니다.
- `-v`는 volume을 맵핑해주는 옵션으로, input 파일과 output 파일을 교환하기 위해 사용됩니다.
    - Volume으로 지정하는 폴더 안에 input 파일이 포함되도록 설정해주세요.
    - 또한 Volume 설정을 하실 때, 상대경로가 아닌 절대경로로 지정해주어야 한다는 것에 유의해주세요.
- `delta-processor-axis`는 앞선 스크립트에서 지정해주었던 이미지의 태그 이름입니다.
- `[ARGUMENTS]`에는 powercrust가 받는 인자가 들어갑니다.
    - 인자에 어떤 것들이 있는지는 [ORIGINAL_README](./powercrust/ORIGINAL_README)를 참고해주세요.
- `INPUT_FILE_NAME`은 medial axis를 수행할 3d 모델 파일이 들어갑니다.
    - 현재까지 `.pts` 파일과 `.off` 파일 포맷만 지원합니다.

