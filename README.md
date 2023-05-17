# Appwrite Telegram bot

Appwrite functions to run telegram bot, in dart and javascript ( more languages support comming soon )


## Documentation

-  Initialize appwrite function `telegram_bot` or `telegram_bot_dart`, check [docs](https://appwrite.io/docs/functions)


-  Run `appwrite deploy function` to deploy function to appwrite


-  Get your Telegram token from [BotFather](https://t.me/BotFather) and add `BOT_TOKEN` env variable in function settings


-  Setup a webhook proxy which will execute this function from telegram request, checkout [this](https://github.com/rohitsangwan01/appwrite_webhook_deta) repo to setup a free webhook proxy using [Deta](https://deta.space/manual/introduction) or [this](https://github.com/Meldiron/railway-webhook-proxy) repo to setup using [Railway](https://railway.app/)


-  Then use that proxy webhook url and bot token to link them to telegram, In order to do that, run this url (in your browser, for example): `https://api.telegram.org/bot<BOT_TOKEN>/setWebhook?url=<WEBHOOK_PROXY_URL>`


-  That's it, go ahead and chat with your bot


## Deploy Using CLI

Make sure you have [Appwrite CLI](https://appwrite.io/docs/command-line#installation) installed, and you have successfully logged into your Appwrite server. To make sure Appwrite CLI is ready, you can use the command `appwrite client --debug` and it should respond with green text `✓ Success`.

Make sure you are in the same folder as your `appwrite.json` file and run `appwrite deploy function` to deploy your function. You will be prompted to select which functions you want to deploy.


## Note 

Currently there are two functions for building telegram chatBot, using Javascript and Dart
