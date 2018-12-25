FROM node:10-slim

RUN set -ex \
    && apt-get update && apt-get install -y git --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

LABEL version="1.0.0"
LABEL maintainer="GitHub Actions <tuki0918+github@gmail.com>"

LABEL com.github.actions.name="GitHub Action for npm (custom)"
LABEL com.github.actions.description="Wraps the npm CLI to enable common npm commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
