# Chatbot Boilerplate - Rasa

Rasa chatbot boilerplate built via docker containers with a component based file structure for improved organization and modularity.

## Requirements
- Docker
- docker-compose

## Add credentials.yml
You can find credentials.yml examples here:<br>
https://github.com/RasaHQ/rasa_core/blob/master/examples/moodbot/credentials.yml

## Train Core and NLU Models
``` bash
make train
```

## Select Chat Connector (Slack, Rest API, Socketio, etc.)
View Rasa supported chat connectors:<br>
https://rasa.com/docs/core/connectors/
``` bash
export Adapter=slack
or 
export Adapter=rest
or 
export Adapter=socketio
```

## Start Core, NLU & Action Services
``` bash
make start
```