#!/bin/sh

apt-get update && apt-get install -y bash git ffmpeg sox && \
bash -c "
cd /workspace && \
git clone https://github.com/coqui-ai/TTS.git && \
cd TTS && \
pip install -e . && \
pip install matplotlib pandas librosa unidecode && \
tts --model_name tts_models/de/thorsten/tacotron2-DDC --download && \
tts --text 'Hallo, ich teste Coqui TTS auf RunPod.' --model_name tts_models/de/thorsten/tacotron2-DDC --out_path /workspace/test.wav
"
