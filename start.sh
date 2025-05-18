echo "=== Installing packages ==="
apt-get update
apt-get install -y git ffmpeg sox

echo "=== Cloning Coqui ==="
cd /workspace
git clone https://github.com/coqui-ai/TTS.git
cd TTS

echo "=== Installing Python dependencies ==="
pip install -e .
pip install matplotlib pandas librosa unidecode

echo "=== Downloading model ==="
python3 -m TTS.api.cli --model_name tts_models/de/thorsten/tacotron2-DDC --download

echo "=== Generating test.wav ==="
python3 -m TTS.api.cli \
  --text "Hallo, ich teste Coqui TTS auf RunPod." \
  --model_name tts_models/de/thorsten/tacotron2-DDC \
  --out_path /workspace/test.wav

echo "=== DONE ==="
