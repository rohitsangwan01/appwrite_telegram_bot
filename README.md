# To run telegram bot on appwrite

Appwrite function to run telegram bot using [grammy](https://github.com/grammyjs/grammY)

## Deploy
1. Initialize appwrite function `telegram_bot`, check [docs](https://appwrite.io/docs/functions)
2. Run `appwrite functions createDeployment  --functionId=telegram_bot  --entrypoint='index.js' --code="."  --activate=true` to deploy function to appwrite
3. Get your Telegram token from [BotFather](https://t.me/BotFather) and add `BOT_TOKEN` variable in `functions>telegram_bot>settings>Update Variables`
4. Setup a webhook proxy which will execute this function from telegram request, checkout [this](https://github.com/rohitsangwan01/appwrite_webhook_deta) repo to setup a free webhook proxy using [Deta](https://deta.space/manual/introduction)
5. Then use that proxy webhook url and bot token to link them to telegram, In order to do that, run this url (in your browser, for example): `https://api.telegram.org/bot<BOT_TOKEN>/setWebhook?url=<WEBHOOK_PROXY_URL>`
6. That's it, go ahead and chat with your bot 🤖💬

