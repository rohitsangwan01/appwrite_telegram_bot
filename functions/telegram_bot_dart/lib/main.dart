// ignore: unused_import
import 'dart:convert';
import 'dart:io';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';
import 'package:telegram_bot_dart/helper.dart';

bool _isInitialized = false;

// Make sure to set BOT_TOKEN environment variable
var bot = Bot(token: Platform.environment['BOT_TOKEN']!);

// Setup bot commands and handlers
Future<void> _setupBot() async {
  bot.onCommand('start', (Bot bot, Update update) async {
    await update.reply(
      'Welcome, ${update.message?.from?.firstName}! \nThis is a demo bot for Appwrite Telegram integration in dart',
    );
  });

  bot.onUpdate((bot, update) async {
    update.reply("Hello from Appwrite Telegram Bot (Dart)");
  });
}

Future<void> start(final req, final res) async {
  try {
    // Initialize bot commands and handlers
    if (!_isInitialized) {
      _isInitialized = true;
      await _setupBot();
    }
    // Parse update from request body and push it to bot
    var payload = req.payload;
    if (payload == null) throw 'Payload is null';
    bot.pushUpdate(Update.fromJson(jsonDecode(payload)['body']));
    res.json({'success': true});
  } catch (e) {
    res.json({'error': e.toString()});
  }
}
