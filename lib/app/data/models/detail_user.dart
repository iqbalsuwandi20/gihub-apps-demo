import 'dart:convert';

DetailUser detailUserFromJson(String str) =>
    DetailUser.fromJson(json.decode(str));

String detailUserToJson(DetailUser data) => json.encode(data.toJson());

class DetailUser {
  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  String userViewType;
  bool siteAdmin;
  String name;
  String? company;
  String? blog;
  String? location;
  String? email;
  dynamic hireable;
  String? bio;
  String? twitterUsername;
  int publicRepos;
  int publicGists;
  int followers;
  int following;
  DateTime createdAt;
  DateTime updatedAt;

  DetailUser({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.userViewType,
    required this.siteAdmin,
    required this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.twitterUsername,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DetailUser.fromJson(Map<String, dynamic> json) => DetailUser(
        login: json["login"] ?? '',
        id: json["id"] ?? 0,
        nodeId: json["node_id"] ?? '',
        avatarUrl: json["avatar_url"] ?? '',
        gravatarId: json["gravatar_id"] ?? '',
        url: json["url"] ?? '',
        htmlUrl: json["html_url"] ?? '',
        followersUrl: json["followers_url"] ?? '',
        followingUrl: json["following_url"] ?? '',
        gistsUrl: json["gists_url"] ?? '',
        starredUrl: json["starred_url"] ?? '',
        subscriptionsUrl: json["subscriptions_url"] ?? '',
        organizationsUrl: json["organizations_url"] ?? '',
        reposUrl: json["repos_url"] ?? '',
        eventsUrl: json["events_url"] ?? '',
        receivedEventsUrl: json["received_events_url"] ?? '',
        type: json["type"] ?? '',
        userViewType: json["user_view_type"] ?? '',
        siteAdmin: json["site_admin"] ?? false,
        name: json["name"] ?? '',
        company: json["company"],
        blog: json["blog"],
        location: json["location"],
        email: json["email"],
        hireable: json["hireable"],
        bio: json["bio"],
        twitterUsername: json["twitter_username"],
        publicRepos: json["public_repos"] ?? 0,
        publicGists: json["public_gists"] ?? 0,
        followers: json["followers"] ?? 0,
        following: json["following"] ?? 0,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "user_view_type": userViewType,
        "site_admin": siteAdmin,
        "name": name,
        "company": company,
        "blog": blog,
        "location": location,
        "email": email,
        "hireable": hireable,
        "bio": bio,
        "twitter_username": twitterUsername,
        "public_repos": publicRepos,
        "public_gists": publicGists,
        "followers": followers,
        "following": following,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
