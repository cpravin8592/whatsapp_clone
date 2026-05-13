class Message {
  String? msgId;
  String? message, imageUrl;
  int? sentAt, recAt, readAt;
  String? fromId, toId;
  int? msgType;

  Message({
    required this.msgId,
    required this.message,
    required this.imageUrl,
    required this.sentAt,
    required this.recAt,
    required this.readAt,
    required this.fromId,
    required this.toId,
    required this.msgType,
  });

  Map<String, dynamic> toMap() => {
    "msgId": msgId,
    "message": message,
    "imageUrl": imageUrl,
    "sentAt": sentAt,
    "recAt": recAt,
    "readAt": readAt,
    "fromId": fromId,
    "toId": toId,
    "msgType": msgType,
  };

  factory Message.fromMap(Map<String, dynamic> map) => Message(
    msgId: map["msgId"],
    message: map["message"],
    imageUrl: map["imageUrl"],
    sentAt: map["sentAt"],
    recAt: map["recAt"],
    readAt: map["readAt"],
    fromId: map["fromId"],
    toId: map["toId"],
    msgType: map["msgType"],
  );
}
