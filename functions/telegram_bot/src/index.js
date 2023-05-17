const { Bot, webhookCallback } = require("grammy");

const bot = new Bot(process.env.BOT_TOKEN);

bot.command("start", async (ctx) => {
  const user = ctx.from;
  if (!user) return;
  await ctx.reply(
    `Welcome ${user.first_name} ${user.last_name} !` +
      "\nThis is a demo bot for Appwrite's Telegram integration."
  );
});

bot.on("message:text", (ctx) => {
  const message = ctx.message.text;
  ctx.reply("Hello from Appwrite!");
});

// Grammy Webhook Adapter for appwrite
const appwriteAdapter = (body, headers, res) => ({
  update: body,
  header: headers.SECRET_HEADER,
  end: () => res.send("Success", 200),
  respond: (json) => {
    res.json(json);
  },
  unauthorized: () => {
    res.send("WRONG_TOKEN_ERROR", 401);
  },
});

const handleUpdate = webhookCallback(bot, appwriteAdapter);

module.exports = async (req, res) => {
  try {
    const obj = JSON.parse(req.payload);
    const response = await handleUpdate(obj.body, obj.headers, res);
    res.json({ data: response });
  } catch (err) {
    console.error(err);
    res.json({
      err: `${err}`,
    });
  }
};
