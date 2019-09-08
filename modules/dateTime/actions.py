# -*- coding: utf-8 -*-
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function
from __future__ import unicode_literals

import logging
import time
import datetime
import pytz
import geocoder
from rasa_core_sdk import Action

logger = logging.getLogger(__name__)

class ActionCurrentTime(Action):
    def name(self):
        return "action_ask_current_time"

    def run(self, dispatcher, tracker, domain):
        timezone_slot = name_slot = tracker.get_slot('timezone')

        if timezone_slot:
            currentDate = datetime.datetime.now(pytz.timezone(timezone_slot))
            dispatcher.utter_message("It is " + currentDate.strftime('%-I:%M %p')) 
        else:
            currentDate = datetime.datetime.now()
            dispatcher.utter_message("It is " + currentDate.strftime('%-I:%M %p') + " GMT") 


        # today = datetime.date.today()
        # print (today.strftime("%A"))
        # print today.strftime("%B")
        # print today.strftime("%d")
        # print today.strftime("%Y")
        # print time.strftime("%I:%M %p")

class CoordiantesForLocation(Action):
    def name(self):
        return "action_ask_coordinates"

    def run(self, dispatcher, tracker, domain):

        test = geocoder.google("Mountain View, CA") # DOESNT WORK!
        dispatcher.utter_message(test)