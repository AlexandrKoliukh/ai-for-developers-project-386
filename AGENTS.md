# Agents

Описание агентов и сервисов проекта.

## claude

Изолированная среда для запуска Claude Code.

- **Образ:** `Dockerfile`
- **Базовый образ:** `node:24-slim`
- **Пользователь:** `claude` (uid 1001)
- **Рабочая директория:** `/workspace`
- **Переменные окружения:** `ANTHROPIC_API_KEY`

Монтирует корень проекта в `/workspace`, что позволяет Claude Code работать с файлами проекта напрямую.

Запуск:
```bash
make claude-up
docker-compose exec claude claude
```

## frontend

Frontend-приложение проекта.

- **Образ:** `Dockerfile.frontend`
- **Базовый образ:** `node:24-slim`
- **Рабочая директория:** `/app`
- **Порт:** `3000`

Запускается независимо от сервиса `claude`.

Запуск:
```bash
make frontend-up
```
