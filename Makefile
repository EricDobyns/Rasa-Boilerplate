clean:
	rm -rf ./build && rm -rf ./models

prepare:
	mkdir ./build && mkdir ./models && mkdir ./models/rasa_core && mkdir ./models/rasa_nlu

compile:
	sh scripts/compile_modules.sh

train_core:
	sh scripts/train_core.sh

train_nlu:
	sh scripts/train_nlu.sh

train:
	make clean && make prepare && make compile && make train_core && make train_nlu && docker-compose build

start_slack:
	export Adapter=slack && docker-compose up -d

start_socketio:
	export Adapter=socketio && docker-compose up -d

start:
	export Adapter=rest && docker-compose up -d