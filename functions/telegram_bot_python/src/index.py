import json
import os
import telebot

bot = telebot.TeleBot(os.environ['BOT_TOKEN'], parse_mode=None)

@bot.message_handler(commands=['start'])
def onStartCommand(message):
	bot.send_message(message.chat.id,  f'Welcome ! \nThis is a demo bot for Appwrite Telegram integration in python')


@bot.message_handler(func=lambda message: True)
def onNewMessage(message):
	bot.send_message(message.chat.id, "Hello from Appwrite Telegram Bot (Python)")

# This is the entry point of the function, when the function is triggered
def main(req, res):
    payload = req.payload
    payload_dict =  json.loads(payload)
    update = telebot.types.Update.de_json(json.dumps(payload_dict["body"]))
    bot.process_new_updates([update])
    return res.json({'success':True})
