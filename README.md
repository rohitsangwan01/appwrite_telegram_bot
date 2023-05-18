# Appwrite Telegram bot

Appwrite functions to run telegram bot, in dart, javascript and python ( more languages support coming soon )


## Documentation

-  Initialize appwrite functions, check [docs](https://appwrite.io/docs/functions)


-  Get your Telegram token from [BotFather](https://t.me/BotFather) and add `BOT_TOKEN` env variable in function settings


-  Setup a webhook proxy to execute these functions, using [appwrite_webhook_deta](https://github.com/rohitsangwan01/appwrite_webhook_deta) or [railway-webhook-proxy](https://github.com/Meldiron/railway-webhook-proxy)


-  Run this url in your browser for setting telegram webhook, `https://api.telegram.org/bot<BOT_TOKEN>/setWebhook?url=<WEBHOOK_PROXY_URL>` 


-  That's it, go ahead and chat with your bot


## Deploy Using CLI

Make sure you have [Appwrite CLI](https://appwrite.io/docs/command-line#installation) installed, and you have successfully logged into your Appwrite server. To make sure Appwrite CLI is ready, you can use the command `appwrite client --debug` and it should respond with green text `✓ Success`.

Make sure you are in the same folder as your `appwrite.json` file and run `appwrite deploy function` to deploy your function. You will be prompted to select which functions you want to deploy.


## Note 

Currently this repo contains few examples of building telegram bots in multiple languages like : dart, javascript, python
