# -*- coding: utf-8 -*-
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function
from __future__ import unicode_literals

import logging
import requests
import json
from rasa_core_sdk import Action

logger = logging.getLogger(__name__)

class ActionThanks(Action):
    def name(self):
        return "action_thanks"

    def run(self, dispatcher, tracker, domain):
        dispatcher.utter_message("Insert an action here...")

class ActionThanks2(Action):
    def name(self):
        return "action_thanks2"

    def run(self, dispatcher, tracker, domain):
        dispatcher.utter_message("Insert another action here...")        
