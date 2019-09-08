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

class ActionGreet(Action):
    def name(self):
        return "action_greet"

    def run(self, dispatcher, tracker, domain):
        name_slot = tracker.get_slot('name')

        if name_slot:
            dispatcher.utter_message("Hello " + name_slot)
        else:
            dispatcher.utter_message("Hi, what is your name?")

        
