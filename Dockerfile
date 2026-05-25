FROM node:20-slim

RUN apt-get update && apt-get install -y \
  ffmpeg \
  imagemagick \
  webp \
  git \
  python3 \
  make \
  g++ \
  build-essential \
  libcairo2-dev \
  libpango1.0-dev \
  libjpeg-dev \
  libgif-dev \
  librsvg2-dev \
  libpixman-1-dev \
  libpng-dev \
  && apt-get upgrade -y \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /root

ARG GITHUB_TOKEN
RUN git clone https://${GITHUB_TOKEN}:x-oauth-basic@github.com/kurameshinatsuki/Supremus_MD bot-reel

WORKDIR /root/bot-reel

RUN npm install --legacy-peer-deps

EXPOSE 8000

CMD ["node", "index.js"]