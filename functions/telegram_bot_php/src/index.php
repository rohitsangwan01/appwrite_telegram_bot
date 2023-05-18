<?php
require_once 'vendor/autoload.php';

// Handle commands
function onCommand($telegram, $command)
{
  $userId = $telegram->UserID();
  $userName = $telegram->FirstName();
  $telegram->sendMessage([
    'chat_id' => $userId,
    'text' => "Welcome, $userName! \nThis is a demo bot for Appwrite Telegram integration in PHP",
  ]);
}

// Handle text messages
function onTextMessage($telegram, $message)
{
  $userId = $telegram->UserID();
  $telegram->sendMessage([
    'chat_id' => $userId,
    'text' => "Hello from Appwrite Telegram Bot (PHP)"
  ]);
}

// Handle other types of messages
function onUpdate($telegram)
{
  $userId = $telegram->UserID();
  $telegram->sendMessage([
    'chat_id' => $userId,
    'text' => "Hello from Appwrite Telegram Bot (PHP)"
  ]);
}


return function ($req, $res) {
  try {
    $payload = $req['payload'];
    $payload_dict = json_decode($payload, true);
    $telegram = new Telegram(getenv('BOT_TOKEN'));
    $telegram->setData($payload_dict['body']);
    // setup telegram handlers
    $text = $telegram->Text();
    if ($text != null && !empty($text)) {
      if (str_starts_with($text, '/')) {
        $command = ltrim($text, '/');
        onCommand($telegram, $command);
      } else {
        onTextMessage($telegram, $text);
      }
    } else {
      onUpdate($telegram);
    }
    // return success
    $res->json([
      'success' => true
    ]);
  } catch (Exception $e) {
    $res->json([
      'error' => $e->getMessage()
    ]);
  }
};