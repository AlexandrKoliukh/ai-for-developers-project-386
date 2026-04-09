### Hexlet tests and linter status:
[![Actions Status](https://github.com/AlexandrKoliukh/ai-for-developers-project-386/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/AlexandrKoliukh/ai-for-developers-project-386/actions)

---

## Запись на звонок

Сервис бронирования времени (Cal.com-like). Один владелец, гости бронируют без аккаунта.

### Быстрый старт

**1. Фронтенд + моки**

```bash
make frontend
```

Открыть: http://localhost:5173

**2. Claude Code в Docker**

```bash
export ANTHROPIC_API_KEY=your_key
make claude
```

Требует `~/.claude` на хосте (настройки и авторизация шарятся автоматически).

### Все команды

```
make help
```

### Тестирование (Playwright)

```bash
# Первый раз: установить Playwright и Chromium
make test-install

# Запустить тесты (Docker-стек поднимается автоматически)
make test          # все тесты
make test-api      # только API-тесты (http://localhost:8000)
make test-e2e      # только E2E-тесты (http://localhost:5173)
make test-headed   # E2E с видимым браузером
make test-report   # открыть HTML-отчёт
```

> Если стек уже запущен (`make up`), тесты переиспользуют существующие серверы и не останавливают их после завершения.
