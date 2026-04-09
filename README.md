### Hexlet tests and linter status:
[![Actions Status](https://github.com/AlexandrKoliukh/ai-for-developers-project-386/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/AlexandrKoliukh/ai-for-developers-project-386/actions)
[![Tests](https://github.com/AlexandrKoliukh/ai-for-developers-project-386/actions/workflows/tests.yml/badge.svg)](https://github.com/AlexandrKoliukh/ai-for-developers-project-386/actions/workflows/tests.yml)

---

## Запись на звонок

Сервис бронирования времени (Cal.com-like). Один владелец, гости бронируют без аккаунта.

**Демо:** https://booking-app-b7xo.onrender.com/

### Структура проекта

```
├── frontend/           Vite + React + TypeScript
├── backend/            FastAPI (Python)
├── src/spec/           TypeSpec → OpenAPI 3.0
├── tests/              Playwright (API + E2E)
├── docker-compose.yml  локальное окружение
├── Dockerfile          production-сборка (Render)
└── Makefile            все команды проекта
```

### Локальное развёртывание

```bash
make install     # установить зависимости фронтенда
make up          # бэкенд + фронтенд
```

- http://localhost:5173 — фронтенд
- http://localhost:8000/docs — API документация

Другие команды:

```bash
make stop        # остановить контейнеры
make logs        # логи контейнеров
make spec        # TypeSpec → openapi.yaml
make build       # production-сборка фронтенда
make tsc         # проверка типов TypeScript
```

Настройки (таймзона, рабочие часы) — в `docker-compose.yml`.

### Тестирование

```bash
make test-install   # первый раз: Playwright + Chromium
make test           # все тесты (стек поднимается автоматически)
```

### Деплой

Приложение деплоится на [Render](https://render.com) через `render.yaml`. Push в `main` запускает автоматический деплой.
