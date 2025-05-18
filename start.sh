#!/bin/bash

echo "=== Systempakete installieren ==="
apt update && apt install -y git espeak-ng ffmpeg sox curl

echo "=== Python-Abhängigkeiten und CUDA-spezifisches PyTorch-Setup ==="
pip install --upgrade pip

pip install --index-url https://download.pytorch.org/whl/cu124 \
    torch==2.4.1+cu124 \
    torchvision==0.19.1+cu124 \
    torchaudio==2.4.1+cu124

echo "=== Weitere Abhängigkeiten ==="
pip install pandas==1.5.3 \
            numpy==1.26.4 \
            coqpit==0.0.17 \
            TTS==0.21.1 \
            trainer==0.0.36 \
            matplotlib librosa unidecode \
            gruut[de,es,fr]==2.2.3 \
            tqdm cython flask g2pkk \
            transformers==4.33.3 \
            encodec \
            einops \
            pysbd \
            pypinyin \
            spacy[ja] \
            umap-learn \
            inflect \
            nltk \
            jamo \
            jieba \
            hangul-romanize \
            bangla \
            bnunicodenormalizer \
            bnnumerizer \
            anyascii \
            aiohttp \
            langcodes

echo "=== TTS Testlauf starten ==="
tts --text "Testausgabe nach erfolgreichem Setup" \
    --model_name tts_models/de/thorsten/tacotron2-DDC \
    --out_path /workspace/test.wav

echo "=== Starte Web-UI ==="
tts-server --model_name tts_models/de/thorsten/tacotron2-DDC \
           --vocoder_name vocoder_models/de/thorsten/hifigan_v1 \
           --use_cuda true \
           --port 7860
