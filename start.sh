#!/bin/sh

echo "=== Systempakete installieren ==="
apt-get update
apt-get install -y git ffmpeg sox espeak-ng

echo "=== Python-Abhängigkeiten installieren ==="
# Kompatible Versionen installieren
pip install torch==2.4.1 torchvision==0.19.1+cu124 torchaudio==2.4.1+cu124 --index-url https://download.pytorch.org/whl/cu124
pip install pandas==1.5.3
pip install TTS==0.21.1 --no-deps --ignore-installed blinker
pip install matplotlib librosa unidecode

echo "=== TTS-Testlauf starten ==="
tts --text "Testausgabe nach automatischem Setup mit Thorsten Stimme" \
    --model_name tts_models/de/thorsten/tacotron2-DDC \
    --out_path /workspace/test.wav

echo "=== FERTIG: test.wav ist erzeugt ==="
tts-server
