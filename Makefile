bdist:
	python setup.py bdist

rpm:
	python setup.py bdist_rpm

wheel:
	python setup.py bdist_wheel

upload:
	python setup.py bdist bdist_rpm bdist_wheel upload

clean:
	@rm -rf .Python MANIFEST build dist venv* *.egg-info *.egg
	@find . -type f -name "*.py[co]" -delete
	@find . -type d -name "__pycache__" -delete

.PHONY: clean bdist rpm wheel upload