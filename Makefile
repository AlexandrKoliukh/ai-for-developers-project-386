# Запись на звонок
# make start  — запустить фронтенд + моки
# make help   — все команды

SPEC_DIR     := src/spec
FRONTEND_DIR := frontend

.PHONY: help start stop logs spec build tsc clean

help:
	@echo ""
	@echo "  start          фронтенд + моки (Docker)"
	@echo "  stop           остановить контейнеры"
	@echo "  logs           логи всех контейнеров"
	@echo "  spec           скомпилировать TypeSpec → openapi.yaml"
	@echo "  build          production-сборка фронтенда"
	@echo "  tsc            проверка типов TypeScript"
	@echo "  clean          удалить артефакты сборки"
	@echo ""

# Запустить фронтенд (Vite) + mock-api (Prism) одной командой
start:
	docker compose up --build

stop:
	docker compose down

logs:
	docker compose logs -f

# Перекомпилировать спек и перезапустить Prism
spec:
	cd $(SPEC_DIR) && npx tsp compile .
	docker compose restart mock-api 2>/dev/null || true

# Локальная сборка фронтенда (без Docker)
build:
	cd $(FRONTEND_DIR) && npm run build

# Проверка типов
tsc:
	cd $(FRONTEND_DIR) && npx tsc --noEmit

clean:
	rm -rf $(FRONTEND_DIR)/dist $(FRONTEND_DIR)/node_modules/.cache
