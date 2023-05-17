import 'package:dart_telegram_bot/telegram_entities.dart';

import 'main.dart';

/// Extension to make it easier to reply to a message
extension UpdateExtension on Update {
  Future<Message?> reply(String text) async {
    if (message == null) return null;
    User? user = message!.from;
    if (user == null) return null;
    return bot.sendMessage(ChatID(user.id), text);
  }
}
