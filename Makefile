venv:
	virtualenv -p $(shell which python3) venv
	./venv/bin/pip install -r requirements.txt

archive.tgz:
	@echo 'Downloading dataset'
	curl -O archive.tgz 'https://f.athena.sh/f/archive.tgz'

archive: archive.tgz
	@echo 'Extracting dataset'
	tar xzvf archive.tgz

lab: archive venv
	./venv/bin/jupyter lab .

clean:
	rm -rf venv
