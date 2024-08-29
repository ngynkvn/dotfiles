FROM debian:latest

RUN apt-get update && apt-get -y --no-install-recommends \
  install \
  curl ca-certificates git \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV GITHUB_USERNAME=ngynkvn
RUN sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply ${GITHUB_USERNAME}
