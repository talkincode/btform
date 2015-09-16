bdist:
	python setup.py bdist

wheel:
	python setup.py bdist_wheel

upload:
	python setup.py bdist  bdist_wheel upload

clean:
	@rm -rf .Python MANIFEST build dist venv* *.egg-info *.egg
	@find . -type f -name "*.py[co]" -delete
	@find . -type d -name "__pycache__" -delete

.PHONY: clean bdist wheel upload