format:
	python -m black -S --line-length 79 .

isort:
	docker exec pipelinerunner isort .

lint:
	docker exec pipelinerunner flake8 /code

ci: isort format type lint pytest
