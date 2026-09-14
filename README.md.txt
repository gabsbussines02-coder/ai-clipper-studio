# AI Clipper Studio V7 — Cloud Multi-Clip

V7 adalah versi cloud-ready untuk HP dan laptop. Upload video sumber yang Anda miliki/berhak proses, lakukan transkripsi, AI memilih Golden Moments, lalu beberapa clip dapat dirender sekaligus menjadi MP4 9:16 1080x1920.

## Fitur
- Responsive/PWA: satu URL untuk HP dan laptop.
- Auto transcription via OpenAI Transcription API.
- Golden Moments hingga 10 kandidat dengan score, hook, title, emotion, reason.
- Pilih Top 3 atau pilih manual.
- Satu upload + satu job untuk banyak clip.
- Job progress dan hasil MP4 per clip.
- FFmpeg crop/scale 9:16 1080x1920.
- API key hanya di server.

## Jalankan dengan Docker
```bash
docker build -t ai-clipper-v7 .
docker run --rm -p 3000:3000 -e OPENAI_API_KEY=YOUR_KEY ai-clipper-v7
```
Buka `http://localhost:3000`.

## Deploy Render
1. Push folder ini ke GitHub.
2. Buat Web Service dari repository.
3. Pilih Docker.
4. Tambahkan `OPENAI_API_KEY` pada Environment.
5. Deploy. Setelah online, URL yang sama dapat dibuka dari HP dan laptop.

## Catatan produksi
V7 menggunakan disk lokal untuk hasil sementara. Pada hosting yang ephemeral, tambahkan object storage (S3/R2/GCS) untuk hasil permanen dan Redis/queue untuk job besar. Untuk pemakaian serius, jangan mengandalkan Map jobs sebagai database karena restart akan menghapus status job.

## Batasan YouTube
Field YouTube URL digunakan untuk identifikasi/preview. Aplikasi tidak mengunduh atau membypass video YouTube. Untuk rendering, gunakan file video yang Anda punya hak/izin untuk diproses atau sumber media yang secara resmi menyediakan akses file.
