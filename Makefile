SPEC_DIR     := src/spec
FRONTEND_DIR := frontend

.PHONY: help frontend claude stop logs spec spec-compile restart-mock install build tsc clean

help:
	@echo ""
	@echo "  frontend       фронтенд + моки (Docker)"
	@echo "  claude         Claude Code (интерактивный, Docker)"
	@echo "  stop           остановить контейнеры"
	@echo "  logs           логи контейнеров"
	@echo "  spec           TypeSpec → openapi.yaml + перезапуск моков"
	@echo "  restart-mock   перезапустить Prism"
	@echo "  install        установить зависимости фронтенда"
	@echo "  build          production-сборка фронтенда"
	@echo "  tsc            проверка типов TypeScript"
	@echo "  clean          удалить артефакты сборки"
	@echo ""

frontend:
	docker compose up frontend mock-api

claude:
	@[ -f $(HOME)/.claude.json ] || echo '{}' > $(HOME)/.claude.json
	docker compose run --rm -it claude-code

stop:
	docker compose down

logs:
	docker compose logs -f

spec:
	cd $(SPEC_DIR) && npx tsp compile .
	$(MAKE) restart-mock

spec-compile: spec

restart-mock:
	docker compose restart mock-api 2>/dev/null || true

install:
	cd $(FRONTEND_DIR) && npm install

build:
	cd $(FRONTEND_DIR) && npm run build

tsc:
	cd $(FRONTEND_DIR) && npx tsc --noEmit

clean:
	rm -rf $(FRONTEND_DIR)/dist $(FRONTEND_DIR)/node_modules/.cache
