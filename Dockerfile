FROM node:20-bookworm-slim
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY server/package.json ./server/package.json
RUN cd server && npm install --omit=dev
COPY . .
RUN mkdir -p data/uploads data/outputs
ENV NODE_ENV=production PORT=3000
EXPOSE 3000
CMD ["node","server/server.js"]
