class EndPoints {
  static const String LOGIN_ENDPOINT = "/api/login";
  static const String ASSIGNED_COURSES =
      "/api/dashboard/user/course/list?limit=30&status=assigned&departments=all&=&language=english";
  static const String COMPLETED_COURSES =
      "/api/dashboard/user/course/list?limit=30&status=completed&departments=all&=&language=english";
  static const String OVERDUE_COURSES =
      "/api/dashboard/user/course/list?limit=30&status=over-due&departments=all&=&language=english";

  static const String PROFILE_ME = "/api/profile/me";

  static const String KNOWLEDGE_REPOSITORY =
      "/api/knowledgeRepository/list?page_no=1&limit=30&published=true&=&language=english";
  static const String USER_NOTIFICATIONS = "/api/notifications?language=english";
}
