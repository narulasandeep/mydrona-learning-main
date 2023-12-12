/// status : "success"
/// message : "Successfully done"
/// data : {"count":3,"records":[{"departments":["NV- NetVision"],"credentials_mapped":[],"chapters_mapped":["287718bb-f325-4973-81b9-9c28934c4cc6","3b751735-3fda-47ff-9cbf-c8a57a789801","f99f21aa-8ecf-43da-a941-375079042f7a"],"type":"task","courselevel":"intermediate","title":"Course Module Two","content":"<p>This Course Module Two and has 10 hours time please hurry up.&nbsp;</p>","hours":10,"start_date":"2022-06-28T18:30:00.000Z","end_date":"2032-06-28T18:30:00.000Z","thumbnail":"private-files/course/999655c7-69e7-4698-9cd3-573a96506cb9.png","course_id":"635af2d2-d610-46c1-8fd8-772a090d79a2","id":"f53e26d4-5a00-46f8-9106-ff7d22c4c7ff","createdAt":"2022-06-29T06:13:49.688Z","updatedAt":"2022-06-29T06:15:28.433Z","is_published":true,"completed_chapters":["f99f21aa-8ecf-43da-a941-375079042f7a"],"quizzes":["52931711-114b-4b94-b85b-7c56a2427c04","52931711-114b-4b94-b85b-7c56a2427c04","96ff8c31-a032-4581-8f8b-6a0da7abdb16"],"due_date":"29 June,2032","latestScore":{"total":6,"right":0,"wrong":0},"score":{"total":0,"right":0,"wrong":0},"status":"over-due"},{"departments":["NO- NetOcean"],"credentials_mapped":[],"chapters_mapped":["f99f21aa-8ecf-43da-a941-375079042f7a"],"type":"task","courselevel":"beginner","title":"Course Module One","content":"<p>This is Course Module one. Just the starting of course. Please read and complete and the course material.</p>","hours":8,"start_date":"2022-06-28T18:30:00.000Z","end_date":"2032-06-28T18:30:00.000Z","thumbnail":"private-files/course/af251f6b-00dd-4e75-a0cc-053830bb4523.png","course_id":"b5b348ac-b78c-46b7-8352-73882dc1b5c6","id":"0bc660cf-d908-4c0c-ad3e-74fcd4bdb554","createdAt":"2022-06-29T00:28:03.076Z","updatedAt":"2022-06-29T00:31:19.395Z","is_published":true,"completed_chapters":["f99f21aa-8ecf-43da-a941-375079042f7a"],"quizzes":["96ff8c31-a032-4581-8f8b-6a0da7abdb16"],"due_date":"29 June,2032","latestScore":{"total":1,"right":0,"wrong":0},"score":{"total":0,"right":0,"wrong":0},"status":"over-due"},{"departments":["NO- NetOcean"],"credentials_mapped":[],"chapters_mapped":[],"type":"task","courselevel":"intermediate","title":"adf","content":"<p>aga</p>","hours":8,"start_date":"2022-06-26T18:30:00.000Z","end_date":"2032-06-26T18:30:00.000Z","thumbnail":"private-files/course/8baf1cb5-3ca8-4b66-9c52-fea5422e92b6.png","course_id":"bc32cd1a-163b-4777-823e-ea52794d6d95","id":"75e41143-7c0a-43fb-bbff-3aacaad65a34","createdAt":"2022-06-27T09:03:00.136Z","updatedAt":"2022-06-27T10:44:18.277Z","is_published":true,"completed_chapters":["f99f21aa-8ecf-43da-a941-375079042f7a"],"quizzes":[],"due_date":"27 June,2032","latestScore":{"total":0,"right":0,"wrong":0},"score":{"total":0,"right":0,"wrong":0},"status":"over-due"}]}

class AllCourses {
  AllCourses({
    this.status,
    this.message,
    this.coursesData,
  });

  AllCourses.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    coursesData = json['data'] != null ? CoursesData.fromJson(json['data']) : null;
  }

  String? status;
  String? message;
  CoursesData? coursesData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (coursesData != null) {
      map['data'] = coursesData?.toJson();
    }
    return map;
  }
}

/// count : 3
/// records : [{"departments":["NV- NetVision"],"credentials_mapped":[],"chapters_mapped":["287718bb-f325-4973-81b9-9c28934c4cc6","3b751735-3fda-47ff-9cbf-c8a57a789801","f99f21aa-8ecf-43da-a941-375079042f7a"],"type":"task","courselevel":"intermediate","title":"Course Module Two","content":"<p>This Course Module Two and has 10 hours time please hurry up.&nbsp;</p>","hours":10,"start_date":"2022-06-28T18:30:00.000Z","end_date":"2032-06-28T18:30:00.000Z","thumbnail":"private-files/course/999655c7-69e7-4698-9cd3-573a96506cb9.png","course_id":"635af2d2-d610-46c1-8fd8-772a090d79a2","id":"f53e26d4-5a00-46f8-9106-ff7d22c4c7ff","createdAt":"2022-06-29T06:13:49.688Z","updatedAt":"2022-06-29T06:15:28.433Z","is_published":true,"completed_chapters":["f99f21aa-8ecf-43da-a941-375079042f7a"],"quizzes":["52931711-114b-4b94-b85b-7c56a2427c04","52931711-114b-4b94-b85b-7c56a2427c04","96ff8c31-a032-4581-8f8b-6a0da7abdb16"],"due_date":"29 June,2032","latestScore":{"total":6,"right":0,"wrong":0},"score":{"total":0,"right":0,"wrong":0},"status":"over-due"},{"departments":["NO- NetOcean"],"credentials_mapped":[],"chapters_mapped":["f99f21aa-8ecf-43da-a941-375079042f7a"],"type":"task","courselevel":"beginner","title":"Course Module One","content":"<p>This is Course Module one. Just the starting of course. Please read and complete and the course material.</p>","hours":8,"start_date":"2022-06-28T18:30:00.000Z","end_date":"2032-06-28T18:30:00.000Z","thumbnail":"private-files/course/af251f6b-00dd-4e75-a0cc-053830bb4523.png","course_id":"b5b348ac-b78c-46b7-8352-73882dc1b5c6","id":"0bc660cf-d908-4c0c-ad3e-74fcd4bdb554","createdAt":"2022-06-29T00:28:03.076Z","updatedAt":"2022-06-29T00:31:19.395Z","is_published":true,"completed_chapters":["f99f21aa-8ecf-43da-a941-375079042f7a"],"quizzes":["96ff8c31-a032-4581-8f8b-6a0da7abdb16"],"due_date":"29 June,2032","latestScore":{"total":1,"right":0,"wrong":0},"score":{"total":0,"right":0,"wrong":0},"status":"over-due"},{"departments":["NO- NetOcean"],"credentials_mapped":[],"chapters_mapped":[],"type":"task","courselevel":"intermediate","title":"adf","content":"<p>aga</p>","hours":8,"start_date":"2022-06-26T18:30:00.000Z","end_date":"2032-06-26T18:30:00.000Z","thumbnail":"private-files/course/8baf1cb5-3ca8-4b66-9c52-fea5422e92b6.png","course_id":"bc32cd1a-163b-4777-823e-ea52794d6d95","id":"75e41143-7c0a-43fb-bbff-3aacaad65a34","createdAt":"2022-06-27T09:03:00.136Z","updatedAt":"2022-06-27T10:44:18.277Z","is_published":true,"completed_chapters":["f99f21aa-8ecf-43da-a941-375079042f7a"],"quizzes":[],"due_date":"27 June,2032","latestScore":{"total":0,"right":0,"wrong":0},"score":{"total":0,"right":0,"wrong":0},"status":"over-due"}]

class CoursesData {
  CoursesData({
    this.count,
    this.coursesRecords,
  });

  CoursesData.fromJson(dynamic json) {
    count = json['count'];
    if (json['records'] != null) {
      coursesRecords = [];
      json['records'].forEach((v) {
        coursesRecords?.add(CoursesRecords.fromJson(v));
      });
    }
  }

  int? count;
  List<CoursesRecords>? coursesRecords;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (coursesRecords != null) {
      map['records'] = coursesRecords?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// departments : ["NV- NetVision"]
/// credentials_mapped : []
/// chapters_mapped : ["287718bb-f325-4973-81b9-9c28934c4cc6","3b751735-3fda-47ff-9cbf-c8a57a789801","f99f21aa-8ecf-43da-a941-375079042f7a"]
/// type : "task"
/// courselevel : "intermediate"
/// title : "Course Module Two"
/// content : "<p>This Course Module Two and has 10 hours time please hurry up.&nbsp;</p>"
/// hours : 10
/// start_date : "2022-06-28T18:30:00.000Z"
/// end_date : "2032-06-28T18:30:00.000Z"
/// thumbnail : "private-files/course/999655c7-69e7-4698-9cd3-573a96506cb9.png"
/// course_id : "635af2d2-d610-46c1-8fd8-772a090d79a2"
/// id : "f53e26d4-5a00-46f8-9106-ff7d22c4c7ff"
/// createdAt : "2022-06-29T06:13:49.688Z"
/// updatedAt : "2022-06-29T06:15:28.433Z"
/// is_published : true
/// completed_chapters : ["f99f21aa-8ecf-43da-a941-375079042f7a"]
/// quizzes : ["52931711-114b-4b94-b85b-7c56a2427c04","52931711-114b-4b94-b85b-7c56a2427c04","96ff8c31-a032-4581-8f8b-6a0da7abdb16"]
/// due_date : "29 June,2032"
/// latestScore : {"total":6,"right":0,"wrong":0}
/// score : {"total":0,"right":0,"wrong":0}
/// status : "over-due"

class CoursesRecords {
  CoursesRecords({
    this.departments,
    this.credentialsMapped,
    this.chaptersMapped,
    this.type,
    this.courselevel,
    this.title,
    this.content,
    this.hours,
    this.startDate,
    this.endDate,
    this.thumbnail,
    this.courseId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.isPublished,
    this.completedChapters,
    this.quizzes,
    this.dueDate,
    this.latestScore,
    this.score,
    this.status,
  });

  CoursesRecords.fromJson(dynamic json) {
    departments = json['departments'] != null ? json['departments'].cast<String>() : [];
    if (json['credentials_mapped'] != null) {
      credentialsMapped = [];
      json['credentials_mapped'].forEach((v) {
        credentialsMapped?.add(v.fromJson(v));
      });
    }
    chaptersMapped = json['chapters_mapped'] != null ? json['chapters_mapped'].cast<String>() : [];
    type = json['type'];
    courselevel = json['courselevel'];
    title = json['title'];
    content = json['content'];
    hours = json['hours'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    thumbnail = json['thumbnail'];
    courseId = json['course_id'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isPublished = json['is_published'];
    completedChapters =
        json['completed_chapters'] != null ? json['completed_chapters'].cast<String>() : [];
    quizzes = json['quizzes'] != null ? json['quizzes'].cast<String>() : [];
    dueDate = json['due_date'];
    latestScore = json['latestScore'] != null ? LatestScore.fromJson(json['latestScore']) : null;
    score = json['score'] != null ? Score.fromJson(json['score']) : null;
    status = json['status'];
  }

  List<String>? departments;
  List<dynamic>? credentialsMapped;
  List<String>? chaptersMapped;
  String? type;
  String? courselevel;
  String? title;
  String? content;
  int? hours;
  String? startDate;
  String? endDate;
  String? thumbnail;
  String? courseId;
  String? id;
  String? createdAt;
  String? updatedAt;
  bool? isPublished;
  List<String>? completedChapters;
  List<String>? quizzes;
  String? dueDate;
  LatestScore? latestScore;
  Score? score;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['departments'] = departments;
    if (credentialsMapped != null) {
      map['credentials_mapped'] = credentialsMapped?.map((v) => v.toJson()).toList();
    }
    map['chapters_mapped'] = chaptersMapped;
    map['type'] = type;
    map['courselevel'] = courselevel;
    map['title'] = title;
    map['content'] = content;
    map['hours'] = hours;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['thumbnail'] = thumbnail;
    map['course_id'] = courseId;
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['is_published'] = isPublished;
    map['completed_chapters'] = completedChapters;
    map['quizzes'] = quizzes;
    map['due_date'] = dueDate;
    if (latestScore != null) {
      map['latestScore'] = latestScore?.toJson();
    }
    if (score != null) {
      map['score'] = score?.toJson();
    }
    map['status'] = status;
    return map;
  }
}

/// total : 0
/// right : 0
/// wrong : 0

class Score {
  Score({
    this.total,
    this.right,
    this.wrong,
  });

  Score.fromJson(dynamic json) {
    total = json['total'];
    right = json['right'];
    wrong = json['wrong'];
  }

  int? total;
  int? right;
  int? wrong;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['right'] = right;
    map['wrong'] = wrong;
    return map;
  }
}

/// total : 6
/// right : 0
/// wrong : 0

class LatestScore {
  LatestScore({
    this.total,
    this.right,
    this.wrong,
  });

  LatestScore.fromJson(dynamic json) {
    total = json['total'];
    right = json['right'];
    wrong = json['wrong'];
  }

  int? total;
  int? right;
  int? wrong;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['right'] = right;
    map['wrong'] = wrong;
    return map;
  }
}
