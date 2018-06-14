setup:
	docker-compose build
	docker-compose run --rm api rails db:setup

serve:
	docker-compose up
