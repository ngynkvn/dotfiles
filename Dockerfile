FROM debian:latest

RUN apt-get update && apt-get -y --no-install-recommends \
  install \
  curl ca-certificates git sudo

ENV GITHUB_USERNAME=ngynkvn
RUN sh -c "$(curl -fsLS get.chezmoi.io)" -- init -v --apply ${GITHUB_USERNAME}
