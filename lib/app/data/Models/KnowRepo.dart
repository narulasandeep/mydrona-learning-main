
class KnowRepoModel {
  KnowRepoModel({
    this.status,
    this.message,
    this.knowRepoData,
  });

  KnowRepoModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    knowRepoData = json['data'] != null ? KnowRepoData.fromJson(json['data']) : null;
  }

  String? status;
  String? message;
  KnowRepoData? knowRepoData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (knowRepoData != null) {
      map['data'] = knowRepoData?.toJson();
    }
    return map;
  }
}

class KnowRepoData {
  KnowRepoData({
    this.count,
    this.records,
  });

  KnowRepoData.fromJson(dynamic json) {
    count = json['count'];
    if (json['records'] != null) {
      records = [];
      json['records'].forEach((v) {
        records?.add(KnowRepoRecords.fromJson(v));
      });
    }
  }

  int? count;
  List<KnowRepoRecords>? records;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (records != null) {
      map['records'] = records?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class KnowRepoRecords {
  KnowRepoRecords({
    this.language,
    this.departments,
    this.title,
    this.content,
    this.knowledgeRepoId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.isPublished,
  });

  KnowRepoRecords.fromJson(dynamic json) {
    language = json['language'];
    departments = json['departments'] != null ? json['departments'].cast<String>() : [];
    title = json['title'];
    content = json['content'];
    knowledgeRepoId = json['knowledge_repo_id'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isPublished = json['is_published'];
  }

  String? language;
  List<String>? departments;
  String? title;
  String? content;
  String? knowledgeRepoId;
  String? id;
  String? createdAt;
  String? updatedAt;
  bool? isPublished;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['language'] = language;
    map['departments'] = departments;
    map['title'] = title;
    map['content'] = content;
    map['knowledge_repo_id'] = knowledgeRepoId;
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['is_published'] = isPublished;
    return map;
  }
}
