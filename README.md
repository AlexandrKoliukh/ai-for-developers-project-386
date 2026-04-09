### Hexlet tests and linter status:
[![Actions Status](https://github.com/AlexandrKoliukh/ai-for-developers-project-386/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/AlexandrKoliukh/ai-for-developers-project-386/actions)

## Сервисы

Проект состоит из двух независимых Docker-сервисов:

| Сервис | Описание |
|--------|----------|
| `claude` | Изолированная среда для работы с Claude Code |
| `frontend` | Frontend-приложение (порт 3000) |

## Требования

- Docker
- Docker Compose
- `ANTHROPIC_API_KEY` в файле `.env`

## Быстрый старт

Скопируйте `.env.example` в `.env` и укажите ключ:

```bash
cp .env.example .env
```

## Команды

### Claude

```bash
make claude-build   # собрать образ
make claude-up      # запустить контейнер
make claude-down    # остановить контейнер
make claude-logs    # логи
```

### Frontend

```bash
make frontend-build  # собрать образ
make frontend-up     # запустить контейнер
make frontend-down   # остановить контейнер
make frontend-logs   # логи
```

### Оба сервиса

```bash
make build  # собрать все образы
make up     # запустить все сервисы
make down   # остановить все сервисы
make logs   # логи всех сервисов
```
