class UserNotifications {
  UserNotifications({
    this.status,
    this.message,
    this.userNotificationsData,
  });

  UserNotifications.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    userNotificationsData = json['data'] != null ? UserNotificationsData.fromJson(json['data']) : null;
  }

  String? status;
  String? message;
  UserNotificationsData? userNotificationsData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (userNotificationsData != null) {
      map['data'] = userNotificationsData?.toJson();
    }
    return map;
  }
}

class UserNotificationsData {
  UserNotificationsData({
    this.count,
    this.unread,
    this.userNotificationsRecords,
  });

  UserNotificationsData.fromJson(dynamic json) {
    count = json['count'];
    unread = json['unread'];
    if (json['records'] != null) {
      userNotificationsRecords = [];
      json['records'].forEach((v) {
        userNotificationsRecords?.add(UserNotificationsRecords.fromJson(v));
      });
    }
  }

  int? count;
  int? unread;
  List<UserNotificationsRecords>? userNotificationsRecords;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['unread'] = unread;
    if (userNotificationsRecords != null) {
      map['records'] = userNotificationsRecords?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class UserNotificationsRecords {
  UserNotificationsRecords({
    this.isRead,
    this.type,
    this.userId,
    this.message,
    this.entityId,
    this.id,
    this.displayAfter,
    this.createdAt,
    this.updatedAt,
  });

  UserNotificationsRecords.fromJson(dynamic json) {
    isRead = json['is_read'];
    type = json['type'];
    userId = json['user_id'];
    message = json['message'];
    entityId = json['entity_id'];
    id = json['id'];
    displayAfter = json['display_after'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  bool? isRead;
  String? type;
  String? userId;
  String? message;
  String? entityId;
  String? id;
  String? displayAfter;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_read'] = isRead;
    map['type'] = type;
    map['user_id'] = userId;
    map['message'] = message;
    map['entity_id'] = entityId;
    map['id'] = id;
    map['display_after'] = displayAfter;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
