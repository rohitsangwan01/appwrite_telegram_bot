import 'dart:convert';
import 'dart:io';
import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

Bot? bot;

Future<void> _setupBot() async {
  bot = Bot(token: Platform.environment['BOT_TOKEN']!);

  bot!.onCommand('start', (Bot bot, Update update) async {
    await update.reply(
      'Welcome, ${update.user?.firstName}! \nThis is a demo bot for Appwrite Telegram integration in dart',
    );
  });

  bot!.onUpdate((bot, update) async {
    update.reply("Hello from Appwrite Telegram Bot (Dart)");
  });
}

extension UpdateExtension on Update {
  Future<Message?> reply(String text) async {
    if (message == null) return null;
    User? user = message!.from;
    if (user == null) return null;
    return bot?.sendMessage(ChatID(user.id), text);
  }

  User? get user => message?.from;
}

// Entry point for the function.
Future<void> start(final req, final res) async {
  try {
    if (bot == null) await _setupBot();
    var payload = req.payload;
    if (payload == null) throw 'Payload is null';
    bot?.pushUpdate(Update.fromJson(jsonDecode(payload)['body']));
    res.json({'success': true});
  } catch (e) {
    res.json({'error': e.toString()});
  }
}
