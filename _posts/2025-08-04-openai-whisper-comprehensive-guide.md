---
date: 2025-08-04 12:00:00
layout: post
title: "AI가 내 말을 찰떡같이 알아듣는다고? OpenAI Whisper 완벽 정복기!"
subtitle: "음성인식 끝판왕 Whisper, A부터 Z까지! 구조, 성능, 꿀팁까지 탈탈 털어드려요 ✨"
description: >-
  "내 말을 이렇게 잘 알아듣는다고?" OpenAI의 초강력 음성인식 모델 Whisper의 모든 것을 파헤쳐봅니다. 99개 언어 지원, 놀라운 정확도, 그리고 당신의 프로젝트를 한 단계 업그레이드 시켜줄 파인튜닝과 양자화 꿀팁까지!
image: https://placehold.co/760x399/7E57C2/FFFFFF?text=Whisper+AI
optimized_image: https://placehold.co/380x200/7E57C2/FFFFFF?text=Whisper
category: AI
tags:
  - OpenAI
  - Whisper
  - ASR
  - Speech Recognition
  - Machine Learning
  - Fine-tuning
  - Quantization
  - AI Model
author: welnai
paginate: true
mermaid: true
---

"아니, AI가 내 말을 이렇게 잘 알아듣는다고?😲"

혹시 음성 비서한테 "오늘 날씨 어때?" 물어봤다가 "오뎅 날치알 찜" 같은 동문서답을 들어본 적 있으신가요? (웃픈 경험... 다들 한 번쯤은 있잖아요?😂)

이제 그런 답답함은 안녕! 2022년 9월, OpenAI가 세상을 깜짝 놀라게 한 음성 인식계의 어벤져스, **Whisper**가 등장했기 때문이죠. 무려 **68만 시간**이라는 어마어마한 양의 데이터로 훈련해서, 전 세계 **99개 언어**를 거의 다 알아듣는 능력자랍니다.

단순히 말을 글로 받아쓰는 걸 넘어, 번역에 언어 탐지까지! 그야말로 음성 인식계의 '만능 치트키'라고 할 수 있죠. 지금부터 저와 함께 Whisper의 세계로 신나게 빠져볼까요?

### 🕵️‍♂️ Whisper는 어떻게 말을 알아들을까? (feat. 똑똑한 번역가)

Whisper의 핵심 구조는 바로 **Encoder-Decoder Transformer**라는 멋진 이름을 가진 아키텍처예요. 이름만 들으면 어렵다고요? 전혀요! UN의 동시통역사를 떠올리면 아주 쉬워요.

1.  **Encoder (열심히 듣는 귀👂)**: 먼저 '인코더'라는 친구가 여러분의 목소리(오디오)를 꼼꼼히 듣고, 컴퓨터가 이해하기 쉬운 '멜 스펙트로그램'이라는 특별한 언어로 요약 정리를 해요. 중요한 포인트를 절대 놓치지 않는 아주 예리한 귀를 가졌죠!
2.  **Decoder (술술 말하는 입👄)**: 그 다음, '디코더'라는 친구가 인코더가 정리한 노트를 받아서, 우리가 읽을 수 있는 완벽한 문장(텍스트)으로 술술 풀어주는 역할을 해요.

이 두 친구의 환상적인 팀워크 덕분에, 어떤 말이든 찰떡같이 알아들을 수 있는 거랍니다!

![Whisper의 구조를 설명하는 이미지](https://placehold.co/600x300/4DB6AC/FFFFFF?text=Encoder+%2B+Decoder+Teamwork!)

<div class="mermaid">
graph TB
    subgraph Architecture["Whisper Architecture"]
        A[Raw Audio Input] --> B[Mel Spectrogram]
        B --> C[Audio Encoder]
        C --> D[Cross Attention]
        E[Text Tokens] --> F[Text Decoder]
        D --> F
        F --> G[Output Text]
        
        subgraph Transformer["Encoder-Decoder Transformer"]
            C
            F
        end
        
        subgraph Tokens["Special Tokens"]
            H[Language Token]
            I[Task Token] 
            J[Timestamp Token]
        end
        
        H --> F
        I --> F
        J --> F
    end
    
    style A fill:#e1f5fe
    style G fill:#c8e6c9
    style C fill:#fff3e0
    style F fill:#fff3e0
</div>

여기에 **특수 토큰**이라는 조미료까지 팍팍! "이건 한국어야!", "이건 번역해줘!", "이 부분은 3분 15초에 한 말이야!" 같은 추가 정보를 콕콕 집어주니, 정확도가 안 높을 수가 없겠죠?

 

### 🚀 Whisper, 뭐가 그렇게 대단한데? (스펙 자랑 타임)

#### 🌍 99개 언어 지원! 이게 되네?

영어는 기본, 한국어, 일본어, 스페인어는 물론이고 우리가 이름도 생소한 언어까지 총 99개 언어를 지원해요. 전 세계 누구와도 소통할 수 있는 만능 번역기를 가진 기분이랄까요?

<div class="mermaid">
pie title Whisper 훈련 데이터 분포 (시간 기준)
    "영어" : 438000
    "중국어" : 42000
    "독일어" : 28000
    "스페인어" : 25000
    "프랑스어" : 23000
    "일본어" : 18000
    "한국어" : 8000
    "기타 언어" : 98000
</div>

#### 🧠 혼자서도 잘해요! 멀티태스킹 능력자

1.  **음성 인식 (Transcription)**: 말하는 대로 텍스트로 착착!
2.  **번역 (Translation)**: 한국어 음성을 영어 텍스트로 바로! (마법 같죠?)
3.  **언어 식별 (Language Identification)**: "이거 어느 나라 말이지?" 궁금해할 필요 없이 Whisper가 알려줘요.
4.  **음성 활동 감지 (Voice Activity Detection)**: 말하는 구간만 똑똑하게 찾아내요.

#### 💪 시끄러워도 괜찮아! 노이즈 캔슬링급 강인함

주변이 시끄러운 카페에서 녹음했거나, 독특한 억양으로 말해도 Whisper는 문제 없어요. 웬만한 방해물은 가뿐히 이겨내는 튼튼한 귀를 가졌답니다.

#### ⚖️ 골라 쓰는 재미! 모델 크기별 성능 비교

Whisper는 tiny, base, small, medium, large 등 다양한 사이즈의 모델이 있어요. 마치 옷 사이즈처럼, 내 상황에 딱 맞는 모델을 고르면 된답니다!

- **작은 모델 (Tiny, Base)**: 가볍고 빨라요! 간단한 작업에 딱! ⚡️
- **큰 모델 (Medium, Large)**: 덩치가 큰 만큼 더 정확하고 똑똑해요! 최고의 성능을 원한다면! 👑

![모델 사이즈를 고르는 이미지](https://placehold.co/600x300/FF7043/FFFFFF?text=Choose+Your+Fighter!)

<div class="mermaid">
graph LR
    subgraph Models["Whisper Model Variants"]
        A[Tiny<br/>39M params] --> B{Accuracy vs Speed}
        C[Base<br/>74M params] --> B
        D[Small<br/>244M params] --> B
        E[Medium<br/>769M params] --> B
        F[Large<br/>1550M params] --> B
        G[Large-v2<br/>1550M params] --> B
        H[Large-v3<br/>1550M params] --> B
        
        B --> I[Higher Accuracy<br/>Slower Speed]
        B --> J[Lower Accuracy<br/>Faster Speed]
    end
    
    style A fill:#ffcdd2
    style C fill:#f8bbd9
    style D fill:#e1bee7
    style E fill:#c5cae9
    style F fill:#bbdefb
    style G fill:#b2dfdb
    style H fill:#c8e6c9
</div>



### 🇰🇷 한국어 성능, 솔직히 어떤데?

"그래서... 한국어는 잘 알아들어?" 가장 궁금한 부분이죠! Whisper는 무려 **8,000시간**의 한국어 데이터로 공부했어요. 전체 68만 시간 중에서는 작은 비중이지만, 영어 다음으로 7번째로 많은 양이니 한국어 성능도 상당히 뛰어나답니다!

#### 살짝 아쉬운 점은? (feat. 귀여운 실수)

물론 아직 완벽하진 않아요. 가끔 **띄어쓰기**를 깜빡하거나, **문장 부호**를 빼먹는 귀여운 실수를 하기도 해요. "아버지가방에들어가신다" 같은 느낌이랄까요? 😂 그래서 완벽한 글을 원한다면 살짝 손봐주는 후처리 과정이 필요하답니다.


### 🎓 내 입맛대로 튜닝하기! 파인튜닝(Fine-tuning)

Whisper는 이미 똑똑한 만능 인재지만, 특정 분야의 '전문가'로 만들 수도 있어요. 이게 바로 **파인튜닝**입니다!

예를 들어, 의학 용어가 가득한 회의를 녹음해야 한다면? 기본 Whisper는 "헤모글로빈" 같은 단어를 잘 모를 수 있겠죠. 이때 의학 전문 용어 데이터를 추가로 학습시켜주면, Whisper는 순식간에 의료 전문 비서로 변신합니다! 👨‍⚕️

심지어 **항공 관제 음성**이나 **특정 지역 사투리**처럼 매우 특수한 분야에서도 파인튜닝이 가능해요. 정말 대단하지 않나요?

![파인튜닝으로 전문가가 되는 Whisper](https://placehold.co/600x300/5C6BC0/FFFFFF?text=Whisper+Gets+a+PhD!)

#### 🎯 LoRA로 더 스마트하게! 파라미터 효율적 파인튜닝

최근엔 **LoRA (Low-Rank Adaptation)**라는 똑똑한 방법도 있어요! 전체 모델을 다시 훈련하는 대신, 꼭 필요한 부분만 살짝 조정해서 시간과 비용을 확 줄이는 기술이죠. 마치 옷의 핏을 살짝만 수선하는 것처럼요! ✂️

#### 파인튜닝, 대충 이런 느낌!

<div class="mermaid">
graph TB
    subgraph BaseModel["기본 Whisper 모델"]
        A[Base Model<br/>68만 시간 학습 완료]
    end
    
    subgraph DomainData["전문 분야 데이터"]
        B[구음 장애 환자 음성]
        C[의료 분야 음성]
        D[특정 지역 사투리]
        E[항공 관제 음성]
        K[게임 용어 데이터]
    end
    
    subgraph FineTuning["파인튜닝 프로세스"]
        F[데이터 전처리]
        G[특징 추출]
        H[모델 훈련]
        I[성능 평가]
    end
    
    subgraph OptimizedModel["최적화된 모델"]
        J[도메인 특화<br/>Whisper 모델]
    end
    
    A --> F
    B --> F
    C --> F
    D --> F
    E --> F
    K --> F
    
    F --> G
    G --> H
    H --> I
    I --> J
    
    style A fill:#e3f2fd
    style J fill:#e8f5e8
    style H fill:#fff3e0
</div>

#### 코드로 살짝 엿보기 (HuggingFace)

"코드는... 어려운데...?" 걱정 마세요! HuggingFace 라이브러리를 사용하면 생각보다 간단하게 파인튜닝을 할 수 있어요.

<details markdown="1">
<summary>👆 HuggingFace 기본 파인튜닝 코드 보기 (클릭해서 펼치기! 🤖)</summary>

```python
from transformers import (
    WhisperFeatureExtractor,
    WhisperTokenizer,
    WhisperProcessor,
    WhisperForConditionalGeneration,
    Seq2SeqTrainer
)

# 1. 필요한 재료들을 불러와요 (모델, 토크나이저 등)
feature_extractor = WhisperFeatureExtractor.from_pretrained("openai/whisper-small")
tokenizer = WhisperTokenizer.from_pretrained("openai/whisper-small")
processor = WhisperProcessor.from_pretrained("openai/whisper-small")
model = WhisperForConditionalGeneration.from_pretrained("openai/whisper-small")

# 2. 훈련 시작! (데이터를 넣고 훈련 버튼만 누르면 끝!)
trainer = Seq2SeqTrainer(
    model=model,
    # ... (훈련 설정은 여기에)
)

trainer.train() # "공부 시작!"
```

</details>

#### 🎯 LoRA 파인튜닝 실전 코드! (더 스마트하게 튜닝하기)

"전체 모델을 다시 훈련하기엔 너무 무겁고... 💸 비용도 부담스럽고..." 그런 분들을 위한 **LoRA 파인튜닝** 코드예요! 

<details markdown="1">
<summary>🎯 LoRA 파인튜닝 완전 코드 보기 (0.21% 파라미터만 훈련하는 마법! ✨)</summary>

```python
from peft import LoraConfig, get_peft_model, TaskType
from transformers import (
    WhisperForConditionalGeneration, 
    WhisperProcessor,
    Seq2SeqTrainer,
    Seq2SeqTrainingArguments
)
import torch

# 1. 기본 Whisper 모델 로드 🤖
model = WhisperForConditionalGeneration.from_pretrained("openai/whisper-small")
processor = WhisperProcessor.from_pretrained("openai/whisper-small")

# 2. LoRA 설정 (여기가 핵심! ✨)
lora_config = LoraConfig(
    r=32,  # 랭크 크기 (높을수록 더 정교하지만 무거워짐)
    lora_alpha=64,  # LoRA 스케일링 팩터
    target_modules=["q_proj", "v_proj"],  # 어느 부분을 튜닝할지 선택
    lora_dropout=0.1,  # 과적합 방지
    bias="none",
    task_type=TaskType.FEATURE_EXTRACTION,
)

# 3. LoRA 모델로 변신! 🦸‍♂️
peft_model = get_peft_model(model, lora_config)

# 4. 훈련 가능한 파라미터만 확인해보기 (놀라실 거예요!)
peft_model.print_trainable_parameters()
# 결과: "전체 741,875,712개 중에서 trainable: 1,572,864 (0.21%만 훈련!) 🎉"

# 5. 훈련 설정
training_args = Seq2SeqTrainingArguments(
    output_dir="./whisper-lora-finetuned",
    per_device_train_batch_size=16,
    gradient_accumulation_steps=1,
    warmup_steps=50,
    max_steps=1000,  # LoRA는 빠르게 학습되니까!
    learning_rate=1e-3,  # 기본보다 조금 높게
    fp16=True,  # 메모리 절약 모드
    evaluation_strategy="steps",
    per_device_eval_batch_size=8,
    predict_with_generate=True,
    generation_max_length=225,
    save_steps=100,
    eval_steps=100,
    logging_steps=25,
    report_to=["tensorboard"],  # 학습 과정 시각화
    load_best_model_at_end=True,
    metric_for_best_model="wer",  # WER(Word Error Rate)로 최고 모델 선택
    greater_is_better=False,
    push_to_hub=False,  # 허깅페이스에 업로드할지 여부
)

# 6. 트레이너 생성 및 훈련 시작! 🚀
trainer = Seq2SeqTrainer(
    model=peft_model,
    args=training_args,
    train_dataset=train_dataset,  # 여러분의 훈련 데이터
    eval_dataset=eval_dataset,    # 검증 데이터
    tokenizer=processor.feature_extractor,
    data_collator=data_collator,
)

# 7. 드디어 훈련! (시간과 메모리가 확 줄어든 걸 느끼실 거예요!)
trainer.train()

# 8. 최고 성능 모델 저장
peft_model.save_pretrained("./best-whisper-lora")
print("LoRA 파인튜닝 완료! 🎉 이제 여러분만의 전문 Whisper가 탄생했어요!")
```

</details>

#### 💡 LoRA 파인튜닝의 마법! 

<details markdown="1">
<summary>💫 학습된 LoRA 모델 불러오기 코드 (나중에 써먹을 때! 🚀)</summary>

```python
# 저장된 LoRA 모델 불러오기 (나중에 사용할 때)
from peft import PeftModel

base_model = WhisperForConditionalGeneration.from_pretrained("openai/whisper-small")
lora_model = PeftModel.from_pretrained(base_model, "./best-whisper-lora")

# 이제 여러분만의 전문 Whisper 사용 준비 완료! ✨
```

</details>



### 🏋️‍♀️ 모델 다이어트 시키기! 양자화(Quantization)

"Large 모델 쓰고 싶은데... 너무 무겁고 느려요 😭"

걱정 마세요! 우리에겐 **양자화**라는 다이어트 비법이 있습니다. 양자화는 모델의 품질은 최대한 유지하면서, 용량은 확 줄이고 속도는 쌩쌩하게 만드는 기술이에요.

고화질 원본 영상(FP32)을 화질 저하 거의 없이 용량만 줄인 압축 파일(INT8)로 만드는 것과 같아요. 덕분에 내 노트북은 물론이고, **스마트폰이나 라즈베리파이** 같은 작은 기기에서도 Whisper를 돌릴 수 있게 되죠! 📱

![양자화로 가벼워지는 모델](https://placehold.co/600x300/26A69A/FFFFFF?text=Model+Diet+Plan!)

#### 양자화 효과, 이 정도라고?

<div class="mermaid">
graph TD
    subgraph Comparison["양자화 전후 비교"]
        A[원본 모델 FP32] --> B{양자화 처리}
        B --> C[INT8 모델]
        B --> D[INT4 모델]
        B --> E[INT16 모델]
        
        subgraph Performance["성능 개선"]
            F[모델 크기 최대 75% 감소]
            G[추론 속도 4-20배 향상]
            H[메모리 사용량 64% 절약]
            I[지연 시간 19% 단축]
            J[엣지 기기 배포 가능]
        end
        
        C --> F
        C --> G
        D --> F
        D --> H
        E --> I
        C --> J
        D --> J
    end
    
    style A fill:#ffcdd2
    style C fill:#c8e6c9
    style D fill:#a5d6a7
    style E fill:#dcedc1
</div>

#### 양자화, 뭘로 하지? (인기 라이브러리)

1.  **HuggingFace Optimum + CTranslate2**: 가장 대중적이고 쓰기 편한 조합!
2.  **faster-whisper**: 속도에 미친듯이 집착하고 싶을 때! ⚡️
3.  **whisper.cpp**: C++ 기반으로, 극한의 최적화를 원할 때!
4.  **GPTQ**: 정확도 손실은 최소화하면서, 팍팍 압축하고 싶을 때!

#### 🚀 faster-whisper로 번개 처리! (제일 쉬운 방법)

"복잡한 건 싫고, 그냥 빨라지면 좋겠어!" 하는 분들을 위한 **faster-whisper** 사용법이에요!

<details markdown="1">
<summary>⚡ faster-whisper 사용법 보기 (4-20배 빨라지는 마법! 🚄)</summary>

```python
from faster_whisper import WhisperModel
import time

# 1. 모델 로드 (INT8 양자화 자동 적용! ✨)
model = WhisperModel("large-v3", device="cuda", compute_type="int8")
# CPU 사용시: device="cpu", compute_type="int8"
# 더 압축: compute_type="int4"  # 메모리 사용량 더욱 줄이기!

# 2. 오디오 파일 처리 (기본 처리와 똑같아요!)
start_time = time.time()
segments, info = model.transcribe("audio.mp3", language="ko")

# 3. 결과 확인
print(f"언어: {info.language} (확신도: {info.language_probability:.2f})")
print(f"총 길이: {info.duration:.2f}초")

# 4. 세그먼트별로 텍스트 출력 (타임스탬프 포함!)
for segment in segments:
    print(f"[{segment.start:.2f}s → {segment.end:.2f}s] {segment.text}")
    
end_time = time.time()
print(f"처리 시간: {end_time - start_time:.2f}초 - 빨라진 거 느껴지시나요? 🚄")
```

</details>

#### ⚡ HuggingFace Optimum으로 INT8 압축하기

"허깅페이스 생태계를 벗어나기 싫어!" 하는 분들을 위한 방법이에요!

<details markdown="1">
<summary>🤗 HuggingFace Optimum으로 INT8 압축하기 (BetterTransformer + 양자화! 🚀)</summary>

```python
from optimum.bettertransformer import BetterTransformer
from transformers import WhisperForConditionalGeneration, WhisperProcessor
import torch

# 1. 기본 모델 로드
model = WhisperForConditionalGeneration.from_pretrained(
    "openai/whisper-small",
    torch_dtype=torch.float16  # 절반 정밀도로 메모리 절약
)
processor = WhisperProcessor.from_pretrained("openai/whisper-small")

# 2. BetterTransformer로 최적화 (속도 향상! 🚀)
model = BetterTransformer.transform(model)

# 3. PyTorch 2.0의 컴파일 기능으로 더욱 빠르게!
if hasattr(torch, 'compile'):
    model.generate = torch.compile(model.generate, mode="reduce-overhead")
    print("모델 컴파일 완료! 더욱 빨라졌어요! ⚡")

# 4. INT8 양자화 (동적 양자화)
model = torch.quantization.quantize_dynamic(
    model, 
    {torch.nn.Linear},  # Linear 레이어만 양자화
    dtype=torch.qint8
)

print("양자화 완료! 모델이 다이어트에 성공했어요! 🎉")
```

</details>

#### 🔥 whisper.cpp로 극한 최적화! (고급자용)

"내 라즈베리파이에서도 돌리고 싶어!" 하는 용감한 분들을 위한 방법이에요!

<details markdown="1">
<summary>🔥 whisper.cpp 설치 & 사용법 보기 (라즈베리파이에서도 OK! 🥧)</summary>

```bash
# 1. 설치 (Linux/Mac)
git clone https://github.com/ggerganov/whisper.cpp.git
cd whisper.cpp
make

# 2. 모델 다운로드 및 변환
bash ./models/download-ggml-model.sh base
# 또는 더 압축된 양자화 버전
bash ./models/download-ggml-model.sh base.en-q5_0  # Q5 양자화 버전

# 3. 실행! (명령어 하나로 끝!)
./main -m models/ggml-base.bin -f audio.wav -l ko

# 4. Python에서 사용하기
```

</details>

<details markdown="1">
<summary>🐍 Python에서 whisper.cpp 호출하기 (subprocess 활용! 🔧)</summary>

```python
import subprocess
import os

def transcribe_with_whisper_cpp(audio_file, model_path="models/ggml-base.bin", language="ko"):
    """
    whisper.cpp를 Python에서 호출하는 함수
    """
    cmd = [
        "./whisper.cpp/main",
        "-m", model_path,
        "-f", audio_file,
        "-l", language,
        "--output-txt"  # 텍스트 파일로 저장
    ]
    
    try:
        result = subprocess.run(cmd, capture_output=True, text=True)
        if result.returncode == 0:
            print("whisper.cpp 처리 완료! 🎉")
            # 결과 파일 읽기
            txt_file = audio_file.replace('.wav', '.txt')
            if os.path.exists(txt_file):
                with open(txt_file, 'r', encoding='utf-8') as f:
                    return f.read()
        else:
            print(f"오류 발생: {result.stderr}")
            return None
    except Exception as e:
        print(f"실행 중 오류: {e}")
        return None

# 사용 예제
result = transcribe_with_whisper_cpp("my_audio.wav")
print(f"결과: {result}")
```

</details>

#### 💎 성능 비교 벤치마크 코드

"진짜로 빨라졌는지 확인해보고 싶어!" 하는 분들을 위한 벤치마크 코드예요!

<details markdown="1">
<summary>💎 성능 비교 벤치마크 코드 보기 (얼마나 빨라졌는지 직접 확인! 📊)</summary>

```python
import time
import psutil
import torch
from faster_whisper import WhisperModel as FastWhisperModel
from transformers import WhisperForConditionalGeneration, WhisperProcessor

def benchmark_whisper_models(audio_file="test_audio.mp3"):
    """
    여러 Whisper 구현체의 성능을 비교하는 함수
    """
    results = {}
    
    # 1. 원본 HuggingFace Whisper
    print("🐌 원본 HuggingFace Whisper 테스트 중...")
    start_memory = psutil.Process().memory_info().rss / 1024 / 1024  # MB
    start_time = time.time()
    
    model = WhisperForConditionalGeneration.from_pretrained("openai/whisper-small")
    processor = WhisperProcessor.from_pretrained("openai/whisper-small")
    # 여기서 실제 처리... (코드 생략)
    
    end_time = time.time()
    end_memory = psutil.Process().memory_info().rss / 1024 / 1024
    
    results['original'] = {
        'time': end_time - start_time,
        'memory': end_memory - start_memory,
        'model_size': 'Large (1.5GB)'
    }
    
    # 2. faster-whisper
    print("🚄 faster-whisper 테스트 중...")
    start_memory = psutil.Process().memory_info().rss / 1024 / 1024
    start_time = time.time()
    
    fast_model = FastWhisperModel("small", device="cpu", compute_type="int8")
    segments, info = fast_model.transcribe(audio_file, language="ko")
    list(segments)  # 실제로 처리하기
    
    end_time = time.time()
    end_memory = psutil.Process().memory_info().rss / 1024 / 1024
    
    results['faster_whisper'] = {
        'time': end_time - start_time,
        'memory': end_memory - start_memory,
        'model_size': 'Compressed (~400MB)'
    }
    
    # 3. 결과 출력
    print("\n🏆 성능 비교 결과:")
    for name, result in results.items():
        print(f"{name}:")
        print(f"  ⏱️  처리 시간: {result['time']:.2f}초")
        print(f"  💾 메모리 사용: {result['memory']:.1f}MB")
        print(f"  📦 모델 크기: {result['model_size']}")
        print()
    
    # 속도 개선 계산
    if len(results) >= 2:
        original_time = results['original']['time']
        fast_time = results['faster_whisper']['time']
        speedup = original_time / fast_time
        print(f"🚀 faster-whisper가 {speedup:.1f}배 더 빨라요! 대박이죠? 🎉")

# 벤치마크 실행
benchmark_whisper_models()
```

</details>

#### 방법별 성능 비교 (골라봐!)

<div class="mermaid">
graph LR
    subgraph Methods["양자화 방법별 성능 비교"]
        A[FP32 원본] 
        B[FP16 절반 압축]
        C[INT8 1/4 압축]
        D[INT4 1/8 압축]
        
        A --> B
        B --> C
        C --> D
        
        subgraph Note["성능 트레이드오프"]
            E[압축률 증가 시<br/>속도 향상<br/>정확도 감소 가능]
        end
        
        D --> E
    end
    
    style A fill:#ffcdd2
    style B fill:#f8bbd9
    style C fill:#c5cae9
    style D fill:#a5d6a7
    style E fill:#fff3e0
</div>



### 🤩 그래서 이걸로 뭘 할 수 있는데? (활용 사례 무한대)

Whisper는 상상하는 모든 것을 현실로 만들어 줄 수 있어요!

<div class="mermaid">
mindmap
  root((Whisper 활용법))
    콘텐츠 제작
      유튜브 자동 자막
      팟캐스트 대본
      강의 내용 기록
      라이브 스트리밍 자막
    스마트 업무
      회의록 작성 자동화
      콜센터 통화 분석
      음성 명령 비서
      항공 관제 통신
    의료 분야
      진료 기록
      응급 상황 분석
      수술실 음성 기록
    접근성 개선
      실시간 자막
      외국어 영상 번역
      청각 장애인 지원
    엣지 디바이스
      IoT 기기 음성 인식
      스마트폰 오프라인 처리
      임베디드 시스템
    개발자 도구
      음성 제어 앱
      AI 챗봇 음성 인식
      게임 내 음성 명령
</div>

### 💻 나도 써보자! Whisper API 사용법

"와, 당장 써보고 싶어!" 하는 분들을 위해 준비했어요. 코딩을 잘 몰라도 괜찮아요. OpenAI API를 사용하면 정말 간단하게 Whisper를 이용할 수 있답니다.

#### 파이썬으로 Whisper 맛보기

<details  markdown="1">
<summary>🍯 OpenAI API로 간단하게 써보기 (코딩 초보도 OK! 👶)</summary>

```python
from openai import OpenAI

client = OpenAI()

# 내 목소리 파일(audio.mp3)을 텍스트로 바꿔줘! (한국어로)
with open("audio.mp3", "rb") as audio_file:
    transcription = client.audio.transcriptions.create(
        model="whisper-1",
        file=audio_file,
        language="ko"  # 한국어라고 알려주면 더 잘 알아들어요!
    )
    print(transcription.text)

# 한국어 오디오 파일(korean_audio.mp3)을 영어로 번역해줘!
with open("korean_audio.mp3", "rb") as audio_file:
    translation = client.audio.translations.create(
        model="whisper-1",
        file=audio_file
    )
    print(translation.text)
```

</details>

#### 지원하는 오디오 형식

-   **파일 형식**: mp3, mp4, mpeg, mpga, m4a, wav, webm (웬만한 건 다 돼요!)
-   **파일 크기**: 최대 25MB (너무 긴 파일은 잘라서 넣어주세요!)

### 🎬 실전 활용! 시나리오별 코드 예제집

"이론은 알겠는데... 실제로는 어떻게 써야 할까요?" 궁금한 분들을 위한 **실전 코드 모음집**이에요!

#### 📺 실시간 마이크 입력 처리 (라이브 자막!)

<details markdown="1">

<summary>"실시간으로 내 목소리를 자막으로 만들고 싶어!" 하는 분들을 위한 코드예요!</summary>

```python
import pyaudio
import wave
import tempfile
import threading
import time
from faster_whisper import WhisperModel
from collections import deque

class RealTimeWhisper:
    def __init__(self, model_size="base", language="ko"):
        # Whisper 모델 로드
        self.model = WhisperModel(model_size, device="cuda", compute_type="int8")
        self.language = language
        
        # 오디오 설정
        self.CHUNK = 1024
        self.FORMAT = pyaudio.paInt16
        self.CHANNELS = 1
        self.RATE = 16000
        self.RECORD_SECONDS = 3  # 3초씩 잘라서 처리
        
        # PyAudio 초기화
        self.audio = pyaudio.PyAudio()
        self.is_recording = False
        self.transcript_queue = deque(maxlen=10)  # 최근 10개 결과 보관
        
    def record_audio_chunk(self):
        """3초 동안 오디오 녹음"""
        stream = self.audio.open(
            format=self.FORMAT,
            channels=self.CHANNELS,
            rate=self.RATE,
            input=True,
            frames_per_buffer=self.CHUNK
        )
        
        frames = []
        for _ in range(0, int(self.RATE / self.CHUNK * self.RECORD_SECONDS)):
            if not self.is_recording:
                break
            data = stream.read(self.CHUNK)
            frames.append(data)
        
        stream.stop_stream()
        stream.close()
        
        return frames
    
    def save_temp_audio(self, frames):
        """임시 오디오 파일로 저장"""
        temp_file = tempfile.NamedTemporaryFile(delete=False, suffix=".wav")
        
        wf = wave.open(temp_file.name, 'wb')
        wf.setnchannels(self.CHANNELS)
        wf.setsampwidth(self.audio.get_sample_size(self.FORMAT))
        wf.setframerate(self.RATE)
        wf.writeframes(b''.join(frames))
        wf.close()
        
        return temp_file.name
    
    def transcribe_chunk(self, audio_file):
        """오디오 파일을 텍스트로 변환"""
        try:
            segments, info = self.model.transcribe(audio_file, language=self.language)
            text = " ".join([segment.text for segment in segments])
            return text.strip()
        except Exception as e:
            print(f"변환 오류: {e}")
            return ""
    
    def start_real_time_transcription(self):
        """실시간 전사 시작!"""
        print("🎤 실시간 음성 인식 시작! (Ctrl+C로 종료)")
        print("=" * 50)
        
        self.is_recording = True
        
        try:
            while self.is_recording:
                # 1. 오디오 녹음
                print("🔴 녹음 중... (3초)")
                frames = self.record_audio_chunk()
                
                if not frames:
                    continue
                
                # 2. 임시 파일 저장
                temp_file = self.save_temp_audio(frames)
                
                # 3. 텍스트 변환 (별도 스레드에서 처리)
                print("⚡ 처리 중...")
                text = self.transcribe_chunk(temp_file)
                
                # 4. 결과 출력
                if text:
                    timestamp = time.strftime("%H:%M:%S")
                    print(f"[{timestamp}] {text}")
                    self.transcript_queue.append((timestamp, text))
                else:
                    print("🔇 (음성이 감지되지 않았습니다)")
                
                # 5. 임시 파일 정리
                import os
                os.unlink(temp_file)
                
        except KeyboardInterrupt:
            print("\n✋ 실시간 전사를 종료합니다.")
            self.stop()
    
    def stop(self):
        """녹음 중지"""
        self.is_recording = False
        self.audio.terminate()
        
        # 전체 결과 출력
        print("\n📝 전체 대화 내용:")
        print("-" * 50)
        for timestamp, text in self.transcript_queue:
            print(f"[{timestamp}] {text}")

# 사용법
if __name__ == "__main__":
    transcriber = RealTimeWhisper(model_size="small", language="ko")
    transcriber.start_real_time_transcription()
```
</details>

#### 🎵 대용량 오디오 파일 배치 처리 (유튜브 영상들 한번에!)

<details  markdown="1">
<summary>"유튜브 영상 100개를 한번에 자막으로 만들고 싶어!" 하는 야심찬 분들을 위한 코드예요!</summary>

```python
import os
import glob
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor, as_completed
from faster_whisper import WhisperModel
import json
from datetime import datetime
import logging

class BatchWhisperProcessor:
    def __init__(self, model_size="large-v3", num_workers=4):
        # 각 워커마다 모델 인스턴스 생성 (메모리 사용량 주의!)
        self.model_size = model_size
        self.num_workers = num_workers
        
        # 로깅 설정
        logging.basicConfig(
            level=logging.INFO,
            format='%(asctime)s - %(levelname)s - %(message)s',
            handlers=[
                logging.FileHandler('whisper_batch.log'),
                logging.StreamHandler()
            ]
        )
        self.logger = logging.getLogger(__name__)
    
    def process_single_file(self, audio_file_path, output_dir="output"):
        """단일 파일 처리"""
        try:
            # 워커별로 모델 로드 (스레드 안전성)
            model = WhisperModel(self.model_size, device="cuda", compute_type="int8")
            
            file_name = Path(audio_file_path).stem
            self.logger.info(f"🎵 처리 시작: {file_name}")
            
            start_time = datetime.now()
            
            # 전사 실행
            segments, info = model.transcribe(
                audio_file_path,
                language="ko",
                word_timestamps=True,  # 단어별 타임스탬프
                vad_filter=True,       # VAD 필터 적용 (무음 구간 제거)
                vad_parameters=dict(min_silence_duration_ms=1000)
            )
            
            # 결과 정리
            transcript = []
            full_text = ""
            
            for segment in segments:
                segment_data = {
                    "start": segment.start,
                    "end": segment.end,
                    "text": segment.text,
                    "words": []
                }
                
                # 단어별 타임스탬프 (있는 경우)
                if hasattr(segment, 'words') and segment.words:
                    for word in segment.words:
                        segment_data["words"].append({
                            "start": word.start,
                            "end": word.end,
                            "word": word.word,
                            "probability": word.probability
                        })
                
                transcript.append(segment_data)
                full_text += segment.text + " "
            
            # 결과 저장
            os.makedirs(output_dir, exist_ok=True)
            
            # 1. JSON 형태로 상세 결과 저장
            result_data = {
                "file_name": file_name,
                "language": info.language,
                "language_probability": info.language_probability,
                "duration": info.duration,
                "processing_time": (datetime.now() - start_time).total_seconds(),
                "full_text": full_text.strip(),
                "segments": transcript
            }
            
            json_path = os.path.join(output_dir, f"{file_name}.json")
            with open(json_path, 'w', encoding='utf-8') as f:
                json.dump(result_data, f, ensure_ascii=False, indent=2)
            
            # 2. 간단한 텍스트 파일 저장
            txt_path = os.path.join(output_dir, f"{file_name}.txt")
            with open(txt_path, 'w', encoding='utf-8') as f:
                f.write(full_text.strip())
            
            # 3. SRT 자막 파일 생성
            srt_path = os.path.join(output_dir, f"{file_name}.srt")
            self.create_srt_file(transcript, srt_path)
            
            processing_time = (datetime.now() - start_time).total_seconds()
            self.logger.info(f"✅ 완료: {file_name} ({processing_time:.2f}초)")
            
            return {
                "file": file_name,
                "status": "success",
                "duration": info.duration,
                "processing_time": processing_time,
                "language": info.language
            }
            
        except Exception as e:
            self.logger.error(f"❌ 오류 ({file_name}): {str(e)}")
            return {
                "file": file_name,
                "status": "error",
                "error": str(e)
            }
    
    def create_srt_file(self, segments, output_path):
        """SRT 자막 파일 생성"""
        with open(output_path, 'w', encoding='utf-8') as f:
            for i, segment in enumerate(segments, 1):
                start_time = self.format_time_for_srt(segment["start"])
                end_time = self.format_time_for_srt(segment["end"])
                
                f.write(f"{i}\n")
                f.write(f"{start_time} --> {end_time}\n")
                f.write(f"{segment['text'].strip()}\n\n")
    
    def format_time_for_srt(self, seconds):
        """SRT 시간 형식으로 변환"""
        hours = int(seconds // 3600)
        minutes = int((seconds % 3600) // 60)
        secs = int(seconds % 60)
        millisecs = int((seconds % 1) * 1000)
        return f"{hours:02d}:{minutes:02d}:{secs:02d},{millisecs:03d}"
    
    def process_directory(self, input_dir, output_dir="output", file_pattern="*.mp3"):
        """디렉토리 내 모든 파일 처리"""
        # 처리할 파일 목록 수집
        audio_files = glob.glob(os.path.join(input_dir, file_pattern))
        audio_files.extend(glob.glob(os.path.join(input_dir, "*.wav")))
        audio_files.extend(glob.glob(os.path.join(input_dir, "*.m4a")))
        audio_files.extend(glob.glob(os.path.join(input_dir, "*.mp4")))
        
        if not audio_files:
            self.logger.warning(f"📁 {input_dir}에서 오디오 파일을 찾을 수 없습니다.")
            return
        
        self.logger.info(f"🎯 처리할 파일: {len(audio_files)}개")
        
        # 병렬 처리
        results = []
        with ThreadPoolExecutor(max_workers=self.num_workers) as executor:
            # 작업 제출
            future_to_file = {
                executor.submit(self.process_single_file, audio_file, output_dir): audio_file 
                for audio_file in audio_files
            }
            
            # 결과 수집
            for future in as_completed(future_to_file):
                result = future.result()
                results.append(result)
                
                # 진행률 출력
                completed = len(results)
                total = len(audio_files)
                progress = (completed / total) * 100
                print(f"📊 진행률: {completed}/{total} ({progress:.1f}%)")
        
        # 최종 결과 요약
        self.print_summary(results)
        
        # 결과 통계를 JSON으로 저장
        summary_path = os.path.join(output_dir, "batch_summary.json")
        with open(summary_path, 'w', encoding='utf-8') as f:
            json.dump({
                "total_files": len(audio_files),
                "successful": len([r for r in results if r["status"] == "success"]),
                "failed": len([r for r in results if r["status"] == "error"]),
                "results": results,
                "timestamp": datetime.now().isoformat()
            }, f, ensure_ascii=False, indent=2)
    
    def print_summary(self, results):
        """결과 요약 출력"""
        successful = [r for r in results if r["status"] == "success"]
        failed = [r for r in results if r["status"] == "error"]
        
        print("\n" + "="*60)
        print("🎉 배치 처리 완료!")
        print("="*60)
        print(f"✅ 성공: {len(successful)}개")
        print(f"❌ 실패: {len(failed)}개")
        
        if successful:
            total_duration = sum(r.get("duration", 0) for r in successful)
            total_processing_time = sum(r.get("processing_time", 0) for r in successful)
            print(f"📊 총 오디오 길이: {total_duration:.1f}초 ({total_duration/60:.1f}분)")
            print(f"⏱️  총 처리 시간: {total_processing_time:.1f}초")
            print(f"🚀 처리 속도: {total_duration/total_processing_time:.1f}x 실시간")
        
        if failed:
            print("\n❌ 실패한 파일들:")
            for result in failed:
                print(f"  - {result['file']}: {result['error']}")

# 사용법
if __name__ == "__main__":
    processor = BatchWhisperProcessor(
        model_size="large-v3", 
        num_workers=2  # GPU 메모리에 맞게 조정
    )
    
    # 디렉토리 내 모든 오디오 파일 처리
    processor.process_directory(
        input_dir="./audio_files",      # 오디오 파일들이 있는 폴더
        output_dir="./transcriptions",  # 결과가 저장될 폴더
        file_pattern="*.mp3"           # 처리할 파일 패턴
    )
```

</details>

#### 🌐 웹 애플리케이션 통합 (Flask + Whisper)

<details markdown="1">
<summary>"내 웹사이트에 음성 인식 기능을 추가하고 싶어!" 하는 개발자분들을 위한 코드예요!</summary>

```python
from flask import Flask, request, jsonify, render_template, send_file
from werkzeug.utils import secure_filename
import os
import tempfile
import threading
from faster_whisper import WhisperModel
from datetime import datetime
import uuid
import json

app = Flask(__name__)
app.config['MAX_CONTENT_LENGTH'] = 25 * 1024 * 1024  # 25MB 제한

# 전역 설정
UPLOAD_FOLDER = 'uploads'
ALLOWED_EXTENSIONS = {'wav', 'mp3', 'mp4', 'm4a', 'webm'}
os.makedirs(UPLOAD_FOLDER, exist_ok=True)

# Whisper 모델 로드 (서버 시작시 한번만)
print("🤖 Whisper 모델 로딩 중...")
whisper_model = WhisperModel("base", device="cuda", compute_type="int8")
print("✅ 모델 로드 완료!")

# 작업 상태 추적
job_status = {}

def allowed_file(filename):
    """허용된 파일 형식인지 확인"""
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

def process_audio_async(job_id, file_path, language="auto"):
    """비동기로 오디오 처리"""
    try:
        job_status[job_id] = {"status": "processing", "progress": 0}
        
        # 전사 처리
        segments, info = whisper_model.transcribe(
            file_path, 
            language=None if language == "auto" else language,
            word_timestamps=True
        )
        
        # 결과 정리
        result = {
            "language": info.language,
            "language_probability": info.language_probability,
            "duration": info.duration,
            "segments": [],
            "full_text": ""
        }
        
        full_text = ""
        for segment in segments:
            segment_data = {
                "start": segment.start,
                "end": segment.end,
                "text": segment.text
            }
            result["segments"].append(segment_data)
            full_text += segment.text + " "
        
        result["full_text"] = full_text.strip()
        
        # 작업 완료
        job_status[job_id] = {
            "status": "completed",
            "progress": 100,
            "result": result,
            "completed_at": datetime.now().isoformat()
        }
        
    except Exception as e:
        job_status[job_id] = {
            "status": "error",
            "error": str(e),
            "failed_at": datetime.now().isoformat()
        }
    finally:
        # 임시 파일 삭제
        if os.path.exists(file_path):
            os.remove(file_path)

@app.route('/')
def index():
    """메인 페이지"""
    return render_template('index.html')

@app.route('/upload', methods=['POST'])
def upload_file():
    """파일 업로드 및 처리 시작"""
    if 'file' not in request.files:
        return jsonify({"error": "파일이 없습니다"}), 400
    
    file = request.files['file']
    language = request.form.get('language', 'auto')
    
    if file.filename == '':
        return jsonify({"error": "파일이 선택되지 않았습니다"}), 400
    
    if file and allowed_file(file.filename):
        # 안전한 파일명 생성
        filename = secure_filename(file.filename)
        job_id = str(uuid.uuid4())
        
        # 임시 파일로 저장
        temp_file = tempfile.NamedTemporaryFile(delete=False, suffix=os.path.splitext(filename)[1])
        file.save(temp_file.name)
        
        # 비동기 처리 시작
        thread = threading.Thread(
            target=process_audio_async,
            args=(job_id, temp_file.name, language)
        )
        thread.start()
        
        return jsonify({
            "job_id": job_id,
            "message": "처리를 시작했습니다. 잠시만 기다려주세요!",
            "status": "processing"
        })
    
    return jsonify({"error": "지원하지 않는 파일 형식입니다"}), 400

@app.route('/status/<job_id>')
def get_status(job_id):
    """작업 상태 확인"""
    if job_id not in job_status:
        return jsonify({"error": "작업을 찾을 수 없습니다"}), 404
    
    return jsonify(job_status[job_id])

@app.route('/download/<job_id>/<format>')
def download_result(job_id, format):
    """결과 다운로드 (txt, json, srt)"""
    if job_id not in job_status or job_status[job_id]["status"] != "completed":
        return jsonify({"error": "완료된 작업이 없습니다"}), 404
    
    result = job_status[job_id]["result"]
    
    if format == "txt":
        # 텍스트 파일 생성
        temp_file = tempfile.NamedTemporaryFile(mode='w', delete=False, suffix='.txt', encoding='utf-8')
        temp_file.write(result["full_text"])
        temp_file.close()
        
        return send_file(
            temp_file.name,
            as_attachment=True,
            download_name=f"transcription_{job_id}.txt",
            mimetype="text/plain"
        )
    
    elif format == "json":
        # JSON 파일 생성
        temp_file = tempfile.NamedTemporaryFile(mode='w', delete=False, suffix='.json', encoding='utf-8')
        json.dump(result, temp_file, ensure_ascii=False, indent=2)
        temp_file.close()
        
        return send_file(
            temp_file.name,
            as_attachment=True,
            download_name=f"transcription_{job_id}.json",
            mimetype="application/json"
        )
    
    elif format == "srt":
        # SRT 자막 파일 생성
        temp_file = tempfile.NamedTemporaryFile(mode='w', delete=False, suffix='.srt', encoding='utf-8')
        
        for i, segment in enumerate(result["segments"], 1):
            start_time = format_time_for_srt(segment["start"])
            end_time = format_time_for_srt(segment["end"])
            
            temp_file.write(f"{i}\n")
            temp_file.write(f"{start_time} --> {end_time}\n")
            temp_file.write(f"{segment['text'].strip()}\n\n")
        
        temp_file.close()
        
        return send_file(
            temp_file.name,
            as_attachment=True,
            download_name=f"subtitles_{job_id}.srt",
            mimetype="text/plain"
        )
    
    return jsonify({"error": "지원하지 않는 형식입니다"}), 400

def format_time_for_srt(seconds):
    """SRT 시간 형식 변환"""
    hours = int(seconds // 3600)
    minutes = int((seconds % 3600) // 60)
    secs = int(seconds % 60)
    millisecs = int((seconds % 1) * 1000)
    return f"{hours:02d}:{minutes:02d}:{secs:02d},{millisecs:03d}"

if __name__ == '__main__':
    print("🌐 Whisper Web Server 시작!")
    print("📝 http://localhost:5000 에서 접속하세요!")
    app.run(host='0.0.0.0', port=5000, debug=True)
```
</details>

#### 📱 WebRTC 실시간 음성 인식 (브라우저에서!)

<details markdown="1">
<summary>"웹 브라우저에서 바로 실시간으로 음성 인식하고 싶어!" 하는 분들을 위한 HTML + JavaScript 코드예요!</summary>

```html
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🎤 실시간 Whisper 음성 인식</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; max-width: 800px; margin: 0 auto; padding: 20px; }
        .container { background: #f5f5f5; padding: 30px; border-radius: 15px; }
        .status { padding: 15px; margin: 10px 0; border-radius: 10px; }
        .recording { background: #ffcccb; border-left: 5px solid #ff4444; }
        .processing { background: #fff4cd; border-left: 5px solid #ffaa00; }
        .completed { background: #d4edda; border-left: 5px solid #28a745; }
        button { padding: 15px 30px; font-size: 16px; border: none; border-radius: 10px; cursor: pointer; margin: 10px; }
        .start-btn { background: #28a745; color: white; }
        .stop-btn { background: #dc3545; color: white; }
        .transcript { background: white; padding: 20px; margin: 10px 0; border-radius: 10px; min-height: 100px; border: 2px dashed #ddd; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🎤 실시간 Whisper 음성 인식</h1>
        <div id="status" class="status">🎯 준비 완료! 시작 버튼을 눌러주세요.</div>
        
        <button id="startBtn" class="start-btn" onclick="startRecording()">🎙️ 녹음 시작</button>
        <button id="stopBtn" class="stop-btn" onclick="stopRecording()" disabled>⏹️ 녹음 중지</button>
        
        <div class="transcript">
            <h3>📝 실시간 전사 결과:</h3>
            <div id="transcript"></div>
        </div>
    </div>

    <script>
        let mediaRecorder;
        let audioChunks = [];
        let isRecording = false;
        let recordingInterval;

        async function startRecording() {
            try {
                // 마이크 접근 권한 요청
                const stream = await navigator.mediaDevices.getUserMedia({ 
                    audio: {
                        sampleRate: 16000,
                        channelCount: 1,
                        echoCancellation: true,
                        noiseSuppression: true
                    } 
                });

                mediaRecorder = new MediaRecorder(stream, {
                    mimeType: 'audio/webm'
                });

                mediaRecorder.ondataavailable = event => {
                    audioChunks.push(event.data);
                };

                mediaRecorder.onstop = async () => {
                    const audioBlob = new Blob(audioChunks, { type: 'audio/webm' });
                    await sendAudioToServer(audioBlob);
                    audioChunks = [];
                };

                // UI 상태 변경
                document.getElementById('startBtn').disabled = true;
                document.getElementById('stopBtn').disabled = false;
                document.getElementById('status').className = 'status recording';
                document.getElementById('status').textContent = '🔴 녹음 중... 자연스럽게 말씀하세요!';

                isRecording = true;

                // 3초마다 청크 단위로 처리
                recordingInterval = setInterval(() => {
                    if (isRecording) {
                        mediaRecorder.stop();
                        mediaRecorder.start();
                    }
                }, 3000);

                mediaRecorder.start();
            } catch (error) {
                console.error('마이크 접근 오류:', error);
                alert('마이크 접근 권한이 필요합니다!');
            }
        }

        function stopRecording() {
            if (mediaRecorder && isRecording) {
                isRecording = false;
                clearInterval(recordingInterval);
                mediaRecorder.stop();
                
                // 마이크 스트림 중지
                const tracks = mediaRecorder.stream.getTracks();
                tracks.forEach(track => track.stop());

                // UI 상태 변경
                document.getElementById('startBtn').disabled = false;
                document.getElementById('stopBtn').disabled = true;
                document.getElementById('status').className = 'status completed';
                document.getElementById('status').textContent = '✅ 녹음 완료! 다시 시작하려면 시작 버튼을 누르세요.';
            }
        }

        async function sendAudioToServer(audioBlob) {
            const formData = new FormData();
            formData.append('file', audioBlob, 'recording.webm');
            formData.append('language', 'ko');

            // 처리 중 표시
            document.getElementById('status').className = 'status processing';
            document.getElementById('status').textContent = '⚡ 음성을 텍스트로 변환 중...';

            try {
                // 1단계: 파일 업로드 및 작업 시작
                const uploadResponse = await fetch('/upload', {
                    method: 'POST',
                    body: formData
                });

                const uploadResult = await uploadResponse.json();
                
                if (uploadResult.job_id) {
                    // 2단계: 주기적으로 상태 확인
                    checkJobStatus(uploadResult.job_id);
                } else {
                    throw new Error(uploadResult.error || '업로드 실패');
                }

            } catch (error) {
                console.error('서버 전송 오류:', error);
                document.getElementById('status').className = 'status';
                document.getElementById('status').textContent = `❌ 오류: ${error.message}`;
            }
        }

        async function checkJobStatus(jobId) {
            try {
                const response = await fetch(`/status/${jobId}`);
                const result = await response.json();

                if (result.status === 'completed') {
                    // 전사 완료!
                    const transcript = result.result.full_text;
                    const timestamp = new Date().toLocaleTimeString();
                    
                    const transcriptDiv = document.getElementById('transcript');
                    transcriptDiv.innerHTML += `
                        <div style="margin: 10px 0; padding: 10px; background: #e3f2fd; border-left: 4px solid #2196f3; border-radius: 5px;">
                            <strong>[${timestamp}]</strong> ${transcript}
                        </div>
                    `;
                    
                    // 스크롤을 최신 내용으로
                    transcriptDiv.scrollTop = transcriptDiv.scrollHeight;
                    
                    if (isRecording) {
                        document.getElementById('status').className = 'status recording';
                        document.getElementById('status').textContent = '🔴 녹음 중... 자연스럽게 말씀하세요!';
                    }
                    
                } else if (result.status === 'error') {
                    console.error('처리 오류:', result.error);
                    document.getElementById('status').textContent = `❌ 처리 오류: ${result.error}`;
                    
                } else if (result.status === 'processing') {
                    // 아직 처리 중이면 1초 후 다시 확인
                    setTimeout(() => checkJobStatus(jobId), 1000);
                }

            } catch (error) {
                console.error('상태 확인 오류:', error);
            }
        }

        // 페이지 로드 시 브라우저 지원 확인
        window.onload = function() {
            if (!navigator.mediaDevices || !navigator.mediaDevices.getUserMedia) {
                alert('이 브라우저는 음성 녹음을 지원하지 않습니다. 최신 브라우저를 사용해주세요!');
                document.getElementById('startBtn').disabled = true;
            }
        };
    </script>
</body>
</html>
```
</details>


### 👍👎 장점과 단점, 솔직하게 알아보기

#### 좋은 점 (이건 진짜 최고! ✨)

<div class="mermaid">
graph LR
    subgraph Advantages["Whisper 장점"]
        A[높은 정확도] --> E[뛰어난 성능]
        B[99개 언어 지원] --> E
        C[멀티태스킹 기능] --> E
        D[오픈소스] --> F[높은 접근성]
        G[Zero-shot 학습] --> F
        H[노이즈 강인성] --> F
        
        E --> I[프로덕션 준비 완료]
        F --> I
    end
    
    style E fill:#c8e6c9
    style F fill:#b2dfdb
    style I fill:#a5d6a7
</div>

#### 아쉬운 점 (앞으로 더 좋아지겠죠? 🤔)

<div class="mermaid">
graph TD
    subgraph Limitations["주요 제한사항"]
        A[환각 현상<br/>Hallucination]
        B[반복적 텍스트 생성]
        C[언어별 성능 편차]
        D[띄어쓰기 문장부호 오류]
    end
    
    subgraph Solutions["해결 방안"]
        E[프롬프트 엔지니어링]
        F[후처리 파이프라인]
        G[언어별 파인튜닝]
        H[규칙 기반 교정]
    end
    
    A --> E
    B --> F
    C --> G
    D --> H
    
    style A fill:#ffcdd2
    style B fill:#ffcdd2
    style C fill:#ffcdd2
    style D fill:#ffcdd2
    style E fill:#c8e6c9
    style F fill:#c8e6c9
    style G fill:#c8e6c9
    style H fill:#c8e6c9
</div>

**환각(Hallucination) 현상**이 뭐냐고요? 조용한 부분에서 Whisper가 너무 열심히 일한 나머지, 있지도 않은 소리를 상상해서 지어내는 현상이에요. "음... 여긴 무슨 말이지? 아! 대충 이런 내용일 거야!" 하고 추측하는 거죠. 귀엽지만 가끔은 곤란하겠죠?

### 🚀 계속 진화하는 Whisper, 어디까지 갈까?

Whisper는 여기서 멈추지 않아요! 최근에 나온 **v3** 버전은 처리 속도가 **8배**나 빨라지고, 다국어 성능과 타임스탬프 정확도도 훨씬 좋아졌어요. 게다가 **Turbo** 모델까지 나와서, 이제 실시간 처리도 가능하답니다! 🚄

### 🚀 프로덕션 배포 꿀팁! (실무에서 바로 쓰는 최적화)

"이제 실제 서비스에 적용해보고 싶어!" 하는 분들을 위한 **실전 배포 노하우**예요!

#### ⚡ GPU 메모리 최적화 (돈 아끼는 비법!)

<details markdown="1">
<summary>"GPU 메모리가 부족해서 큰 모델을 못 써 😭" 하는 분들을 위한 마법의 코드예요!</summary>

```python
import torch
from faster_whisper import WhisperModel
import gc

class MemoryOptimizedWhisper:
    def __init__(self, model_size="large-v3"):
        self.model_size = model_size
        self.model = None
        
    def load_model_on_demand(self):
        """필요할 때만 모델 로드"""
        if self.model is None:
            print("🤖 모델 로딩 중...")
            self.model = WhisperModel(
                self.model_size, 
                device="cuda", 
                compute_type="int8",
                download_root="./models",  # 로컬에 모델 캐시
                local_files_only=False
            )
            print("✅ 로드 완료!")
    
    def unload_model(self):
        """모델 메모리 해제"""
        if self.model is not None:
            del self.model
            self.model = None
            gc.collect()
            torch.cuda.empty_cache()
            print("🗑️ 메모리 정리 완료!")
    
    def transcribe_batch(self, audio_files, max_concurrent=2):
        """배치 처리로 메모리 효율적으로"""
        results = []
        
        try:
            self.load_model_on_demand()
            
            for i in range(0, len(audio_files), max_concurrent):
                batch = audio_files[i:i + max_concurrent]
                
                for audio_file in batch:
                    print(f"🎵 처리 중: {audio_file}")
                    segments, info = self.model.transcribe(
                        audio_file,
                        language="ko",
                        vad_filter=True,  # 무음 구간 제거로 속도 향상
                        condition_on_previous_text=False  # 메모리 절약
                    )
                    
                    text = " ".join([segment.text for segment in segments])
                    results.append({
                        "file": audio_file,
                        "text": text,
                        "language": info.language,
                        "duration": info.duration
                    })
                
                # 배치마다 메모리 정리
                if i + max_concurrent < len(audio_files):
                    torch.cuda.empty_cache()
                    print(f"📊 진행률: {min(i + max_concurrent, len(audio_files))}/{len(audio_files)}")
        
        finally:
            # 작업 완료 후 메모리 해제
            self.unload_model()
        
        return results

# 사용법
optimizer = MemoryOptimizedWhisper("large-v3")
audio_files = ["file1.mp3", "file2.mp3", "file3.mp3"]
results = optimizer.transcribe_batch(audio_files, max_concurrent=2)
```
</details>

#### 🐳 Docker로 간편 배포! (클릭 한 번으로 배포)

<details markdown="1">
<summary>"복잡한 설정 없이 어디서든 바로 실행하고 싶어!" 하는 분들을 위한 Docker 설정이에요!</summary>

```dockerfile
# Dockerfile
FROM nvidia/cuda:12.1-runtime-ubuntu22.04

# 필수 패키지 설치
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# 작업 디렉토리 설정
WORKDIR /app

# 요구사항 파일 복사 및 설치
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# 애플리케이션 파일 복사
COPY . .

# 모델 캐시 디렉토리 생성
RUN mkdir -p /app/models

# 포트 노출
EXPOSE 5000

# 헬스체크
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
    CMD curl -f http://localhost:5000/health || exit 1

# 애플리케이션 실행
CMD ["python3", "app.py"]
```


```yaml
# docker-compose.yml
version: '3.8'

services:
  whisper-api:
    build: .
    ports:
      - "5000:5000"
    volumes:
      - ./models:/app/models  # 모델 캐시 영구 저장
      - ./uploads:/app/uploads
      - ./outputs:/app/outputs
    environment:
      - CUDA_VISIBLE_DEVICES=0  # GPU 선택
      - WHISPER_MODEL_SIZE=large-v3
      - MAX_WORKERS=2
    restart: unless-stopped
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: 1
              capabilities: [gpu]

  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
    depends_on:
      - whisper-api
    restart: unless-stopped
```



```bash
# 한 번에 실행!
echo "🐳 Docker로 Whisper 서비스 시작!"
docker-compose up -d

echo "🌐 http://localhost 에서 확인하세요!"
echo "📊 상태 확인: docker-compose logs -f"
```
</details>

#### ⚖️ 로드 밸런싱 & 스케일링 (트래픽 폭증에도 끄떡없어!)

<details markdown="1">
<summary>"사용자가 많아져서 서버가 터져요!" 하는 행복한 고민이 있는 분들을 위한 코드예요!</summary>

```python
# load_balancer.py
import asyncio
import aiohttp
from concurrent.futures import ThreadPoolExecutor
import random
import time

class WhisperLoadBalancer:
    def __init__(self):
        # 여러 Whisper 서버 인스턴스
        self.servers = [
            "http://whisper-server-1:5000",
            "http://whisper-server-2:5000", 
            "http://whisper-server-3:5000",
        ]
        self.server_stats = {server: {"load": 0, "last_check": 0} for server in self.servers}
    
    async def get_best_server(self):
        """가장 부하가 적은 서버 선택"""
        current_time = time.time()
        
        # 5초마다 서버 상태 확인
        for server in self.servers:
            if current_time - self.server_stats[server]["last_check"] > 5:
                try:
                    async with aiohttp.ClientSession() as session:
                        async with session.get(f"{server}/health") as response:
                            if response.status == 200:
                                data = await response.json()
                                self.server_stats[server]["load"] = data.get("current_jobs", 0)
                                self.server_stats[server]["last_check"] = current_time
                except:
                    # 서버가 응답하지 않으면 높은 부하로 처리
                    self.server_stats[server]["load"] = 999
        
        # 가장 부하가 적은 서버 반환
        best_server = min(self.server_stats.items(), key=lambda x: x[1]["load"])
        return best_server[0]
    
    async def transcribe_with_failover(self, audio_file, language="ko", max_retries=3):
        """장애 발생시 자동으로 다른 서버로 재시도"""
        
        for attempt in range(max_retries):
            try:
                server = await self.get_best_server()
                print(f"🎯 시도 #{attempt + 1}: {server}")
                
                data = aiohttp.FormData()
                data.add_field('file', audio_file, filename='audio.mp3')
                data.add_field('language', language)
                
                async with aiohttp.ClientSession() as session:
                    # 1단계: 작업 제출
                    async with session.post(f"{server}/upload", data=data) as response:
                        result = await response.json()
                        
                        if response.status == 200:
                            job_id = result["job_id"]
                            
                            # 2단계: 결과 대기
                            while True:
                                await asyncio.sleep(1)  # 1초 대기
                                
                                async with session.get(f"{server}/status/{job_id}") as status_response:
                                    status_data = await status_response.json()
                                    
                                    if status_data["status"] == "completed":
                                        print(f"✅ 성공! ({server})")
                                        return status_data["result"]
                                    elif status_data["status"] == "error":
                                        raise Exception(f"서버 처리 오류: {status_data.get('error')}")
                        else:
                            raise Exception(f"서버 오류: {result.get('error')}")
            
            except Exception as e:
                print(f"❌ 시도 #{attempt + 1} 실패: {e}")
                if attempt == max_retries - 1:
                    raise Exception(f"모든 재시도 실패: {e}")
                await asyncio.sleep(2 ** attempt)  # 지수 백오프

# 사용법
async def main():
    balancer = WhisperLoadBalancer()
    
    # 동시에 여러 파일 처리
    audio_files = ["file1.mp3", "file2.mp3", "file3.mp3"]
    
    tasks = []
    for audio_file in audio_files:
        with open(audio_file, 'rb') as f:
            task = balancer.transcribe_with_failover(f)
            tasks.append(task)
    
    # 병렬 처리
    results = await asyncio.gather(*tasks)
    
    for i, result in enumerate(results):
        print(f"파일 {audio_files[i]}: {result['full_text'][:50]}...")

# 실행
# asyncio.run(main())
```
</details>

#### 📊 모니터링 & 로깅 (문제 발생 전에 미리 알자!)

<details markdown="1">
<summary>"서비스가 잘 돌고 있는지 확인하고 싶어!" 하는 책임감 있는 분들을 위한 코드예요!</summary>

```python
# monitoring.py
import logging
import time
import psutil
import GPUtil
from prometheus_client import Counter, Histogram, Gauge, start_http_server
from functools import wraps

# Prometheus 메트릭 정의
REQUEST_COUNT = Counter('whisper_requests_total', 'Total number of requests', ['endpoint', 'status'])
REQUEST_DURATION = Histogram('whisper_request_duration_seconds', 'Request duration')
GPU_MEMORY_USAGE = Gauge('whisper_gpu_memory_percent', 'GPU memory usage percentage')
CPU_USAGE = Gauge('whisper_cpu_usage_percent', 'CPU usage percentage')
ACTIVE_JOBS = Gauge('whisper_active_jobs', 'Number of active transcription jobs')

class WhisperMonitor:
    def __init__(self, log_level=logging.INFO):
        # 로깅 설정
        logging.basicConfig(
            level=log_level,
            format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
            handlers=[
                logging.FileHandler('whisper_service.log'),
                logging.StreamHandler()
            ]
        )
        self.logger = logging.getLogger('WhisperService')
        
        # 메트릭 서버 시작
        start_http_server(8000)
        self.logger.info("📊 메트릭 서버 시작: http://localhost:8000")
    
    def monitor_endpoint(self, endpoint_name):
        """엔드포인트 모니터링 데코레이터"""
        def decorator(func):
            @wraps(func)
            def wrapper(*args, **kwargs):
                start_time = time.time()
                status = "success"
                
                try:
                    result = func(*args, **kwargs)
                    self.logger.info(f"✅ {endpoint_name} 성공")
                    return result
                except Exception as e:
                    status = "error"
                    self.logger.error(f"❌ {endpoint_name} 실패: {str(e)}")
                    raise
                finally:
                    duration = time.time() - start_time
                    REQUEST_COUNT.labels(endpoint=endpoint_name, status=status).inc()
                    REQUEST_DURATION.observe(duration)
                    
                    self.logger.info(f"⏱️ {endpoint_name} 처리 시간: {duration:.2f}초")
            
            return wrapper
        return decorator
    
    def update_system_metrics(self):
        """시스템 메트릭 업데이트"""
        try:
            # CPU 사용률
            cpu_percent = psutil.cpu_percent(interval=1)
            CPU_USAGE.set(cpu_percent)
            
            # GPU 메모리 사용률
            try:
                gpus = GPUtil.getGPUs()
                if gpus:
                    gpu_memory = gpus[0].memoryUtil * 100
                    GPU_MEMORY_USAGE.set(gpu_memory)
                    
                    if gpu_memory > 90:
                        self.logger.warning(f"🚨 GPU 메모리 부족: {gpu_memory:.1f}%")
            except:
                self.logger.warning("GPU 정보를 가져올 수 없습니다.")
            
            # 로그 출력
            self.logger.debug(f"💻 CPU: {cpu_percent:.1f}%")
            
        except Exception as e:
            self.logger.error(f"메트릭 업데이트 오류: {str(e)}")
    
    def health_check(self):
        """시스템 상태 확인"""
        status = {
            "status": "healthy",
            "timestamp": time.time(),
            "system": {}
        }
        
        try:
            # 메모리 확인
            memory = psutil.virtual_memory()
            status["system"]["memory_percent"] = memory.percent
            
            # 디스크 확인
            disk = psutil.disk_usage('/')
            status["system"]["disk_percent"] = (disk.used / disk.total) * 100
            
            # 임계치 확인
            if memory.percent > 85:
                status["status"] = "warning"
                status["warnings"] = status.get("warnings", [])
                status["warnings"].append(f"메모리 사용량 높음: {memory.percent:.1f}%")
            
            if status["system"]["disk_percent"] > 85:
                status["status"] = "warning"
                status["warnings"] = status.get("warnings", [])
                status["warnings"].append(f"디스크 사용량 높음: {status['system']['disk_percent']:.1f}%")
            
        except Exception as e:
            status["status"] = "error"
            status["error"] = str(e)
            self.logger.error(f"헬스체크 오류: {str(e)}")
        
        return status

# 사용법 예제
monitor = WhisperMonitor()

@monitor.monitor_endpoint("transcribe")
def transcribe_audio(audio_file):
    """모니터링이 적용된 전사 함수"""
    ACTIVE_JOBS.inc()  # 활성 작업 수 증가
    
    try:
        # 실제 전사 작업
        model = WhisperModel("base")
        segments, info = model.transcribe(audio_file)
        result = " ".join([segment.text for segment in segments])
        
        monitor.logger.info(f"📝 전사 완료: {len(result)}자")
        return result
        
    finally:
        ACTIVE_JOBS.dec()  # 활성 작업 수 감소

# Flask 앱에 적용
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/health')
def health():
    """헬스체크 엔드포인트"""
    return jsonify(monitor.health_check())

@app.route('/metrics')
def metrics():
    """커스텀 메트릭 (Prometheus 형식)"""
    monitor.update_system_metrics()
    return "메트릭이 http://localhost:8000 에서 제공됩니다."

if __name__ == '__main__':
    monitor.logger.info("🚀 Whisper 서비스 모니터링 시작!")
    app.run(host='0.0.0.0', port=5000)
```
</details>

<details markdown="1">
<summary> #### 🔧 성능 튜닝 체크리스트 (마지막 최적화!)</summary>

```python
# performance_tips.py

class WhisperPerformanceTips:
    """
    🚀 Whisper 성능 최적화 완벽 가이드
    """
    
    @staticmethod
    def optimize_model_loading():
        """모델 로딩 최적화"""
        print("📚 모델 로딩 최적화 팁:")
        print("✅ 1. 로컬에 모델 캐시하기")
        print("✅ 2. 필요할 때만 모델 로드")
        print("✅ 3. 작은 모델부터 시작해서 단계적 업그레이드")
        print("✅ 4. INT8 양자화 적극 활용")
        
        return {
            "cache_dir": "./models",
            "compute_type": "int8", 
            "local_files_only": True
        }
    
    @staticmethod
    def optimize_inference():
        """추론 최적화"""
        print("\n⚡ 추론 속도 최적화:")
        print("✅ 1. VAD 필터로 무음 구간 제거")
        print("✅ 2. condition_on_previous_text=False로 메모리 절약")
        print("✅ 3. 오디오 전처리로 품질 향상")
        print("✅ 4. 배치 처리로 효율성 증대")
        
        return {
            "vad_filter": True,
            "condition_on_previous_text": False,
            "beam_size": 1,  # 빠른 처리
            "temperature": 0.0  # 일관성 향상
        }
    
    @staticmethod
    def memory_management():
        """메모리 관리"""
        print("\n💾 메모리 최적화:")
        print("✅ 1. 사용 후 torch.cuda.empty_cache()")
        print("✅ 2. gc.collect()로 가비지 컬렉션")
        print("✅ 3. 큰 파일은 청크 단위로 처리")
        print("✅ 4. 모델 언로드 후 재로드")
        
        import torch
        import gc
        
        # 메모리 정리 함수
        def cleanup():
            gc.collect()
            if torch.cuda.is_available():
                torch.cuda.empty_cache()
        
        return cleanup
    
    @staticmethod
    def production_checklist():
        """프로덕션 배포 체크리스트"""
        checklist = [
            "🔍 로깅 및 모니터링 설정",
            "🚨 에러 핸들링 및 재시도 로직",
            "⚖️ 로드 밸런싱 구성",
            "📊 성능 메트릭 수집",
            "🔒 보안 설정 (파일 업로드 제한 등)",
            "💾 캐시 전략 수립",
            "🐳 컨테이너화 및 오케스트레이션",
            "📈 스케일링 전략",
            "🔄 CI/CD 파이프라인 구축",
            "📋 문서화 및 API 스펙"
        ]
        
        print("\n📋 프로덕션 배포 체크리스트:")
        for item in checklist:
            print(f"  {item}")
        
        return checklist

# 성능 최적화 적용
if __name__ == "__main__":
    tips = WhisperPerformanceTips()
    
    model_config = tips.optimize_model_loading()
    inference_config = tips.optimize_inference()
    cleanup_func = tips.memory_management()
    checklist = tips.production_checklist()
    
    print(f"\n🎉 최적화 설정 완료! 이제 여러분의 Whisper가 번개처럼 빨라질 거예요! ⚡")
```
</details>

#### Whisper의 미래는?

<div class="mermaid">
timeline
    title Whisper 발전 로드맵
    
    2022 : Whisper v1 출시
         : 68만 시간 학습
         : 99개 언어 지원
    
    2023 : Whisper v2 개선
         : 성능 최적화
         : 안정성 향상
    
    2024 : Whisper v3 & Turbo
         : 8배 속도 개선
         : 실시간 처리 가능
    
    2025 : 예상 발전 방향
         : 더 많은 언어 지원
         : 실시간 동시통역 강화
         : 엣지 디바이스 최적화
         : 더욱 정확한 감정 인식
</div>

## 🎉 결론: Whisper, 이제 선택이 아닌 필수!

OpenAI Whisper는 음성 인식 분야의 '게임 체인저' 그 자체입니다.

1.  **범용성**: 99개 언어로 전 세계를 무대로!
2.  **편의성**: 오픈소스로 누구나 쉽게!
3.  **확장성**: 내 입맛대로 튜닝해서 최적화!
4.  **실용성**: 이미 수많은 서비스에서 검증된 성능!

특히 한국어에서도 뛰어난 성능을 보여주는 만큼, 여러분의 프로젝트에 날개를 달아줄 강력한 무기가 될 거예요. 파인튜닝과 양자화까지 곁들인다면, 상상만 하던 음성 인식 솔루션을 직접 만들 수 있답니다.

앞으로 또 어떻게 우리를 놀라게 할지, 계속해서 지켜보자고요!

---

## 참고 자료

- [Whisper 모델 분석 - TuringPost](https://turingpost.co.kr/p/topic-15-openai-whisper)
- [Whisper API 사용법 - Magic AI Prompts](https://www.magicaiprompts.com/docs/gpt-chatbot/whisper-speech-recognition-api/)
- [Whisper 파인튜닝 가이드](https://ysg2997.tistory.com/53)
- [Whisper 양자화 최적화](https://medium.com/@daniel-klitzke/quantizing-openais-whisper-with-the-huggingface-optimum-library-30-faster-inference-64-36d9815190e0)
- [양자화 성능 비교 연구](https://www.chatpaper.ai/ko/dashboard/paper/3074c9d4-da0c-4444-85b2-23949f26829c)
