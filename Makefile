.PHONY: claude-build claude-up claude-down claude-logs \
        frontend-build frontend-up frontend-down frontend-logs \
        build up down logs

# Claude service
claude-build:
	docker-compose build claude

claude-up:
	docker-compose up -d claude

claude-down:
	docker-compose stop claude

claude-logs:
	docker-compose logs -f claude

# Frontend service
frontend-build:
	docker-compose build frontend

frontend-up:
	docker-compose up -d frontend

frontend-down:
	docker-compose stop frontend

frontend-logs:
	docker-compose logs -f frontend

# Both services
build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

logs:
	docker-compose logs -f
