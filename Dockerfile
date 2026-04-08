FROM node:24-slim

# Устанавливаем системные пакеты как root
RUN apt-get update && apt-get install -y git curl bash sudo \
    && rm -rf /var/lib/apt/lists/*

# Создаём пользователя
RUN useradd -m -u 1001 claude && \
    echo "claude ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Устанавливаем Claude Code от root (самый надёжный способ)
RUN npm install -g @anthropic-ai/claude-code

# Теперь переключаемся на обычного пользователя
USER claude

ENV NPM_CONFIG_PREFIX=/home/claude/.npm-global
ENV PATH=$PATH:/home/claude/.npm-global/bin

WORKDIR /workspace

CMD ["bash"]