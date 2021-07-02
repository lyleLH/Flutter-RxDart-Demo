import 'package:equatable/equatable.dart';

class Owner extends Equatable {
  final String? login;
  final int? id;
  final String? nodeId;
  final String? avatarUrl;
  final String? gravatarId;
  final String? url;
  final String? htmlUrl;
  final String? followersUrl;
  final String? followingUrl;
  final String? gistsUrl;
  final String? starredUrl;
  final String? subscriptionsUrl;
  final String? organizationsUrl;
  final String? reposUrl;
  final String? eventsUrl;
  final String? receivedEventsUrl;
  final String? type;
  final bool? siteAdmin;

  const Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        login: json['login'] as String?,
        id: json['id'] as int?,
        nodeId: json['node_id'] as String?,
        avatarUrl: json['avatar_url'] as String?,
        gravatarId: json['gravatar_id'] as String?,
        url: json['url'] as String?,
        htmlUrl: json['html_url'] as String?,
        followersUrl: json['followers_url'] as String?,
        followingUrl: json['following_url'] as String?,
        gistsUrl: json['gists_url'] as String?,
        starredUrl: json['starred_url'] as String?,
        subscriptionsUrl: json['subscriptions_url'] as String?,
        organizationsUrl: json['organizations_url'] as String?,
        reposUrl: json['repos_url'] as String?,
        eventsUrl: json['events_url'] as String?,
        receivedEventsUrl: json['received_events_url'] as String?,
        type: json['type'] as String?,
        siteAdmin: json['site_admin'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'login': login,
        'id': id,
        'node_id': nodeId,
        'avatar_url': avatarUrl,
        'gravatar_id': gravatarId,
        'url': url,
        'html_url': htmlUrl,
        'followers_url': followersUrl,
        'following_url': followingUrl,
        'gists_url': gistsUrl,
        'starred_url': starredUrl,
        'subscriptions_url': subscriptionsUrl,
        'organizations_url': organizationsUrl,
        'repos_url': reposUrl,
        'events_url': eventsUrl,
        'received_events_url': receivedEventsUrl,
        'type': type,
        'site_admin': siteAdmin,
      };

  Owner copyWith({
    String? login,
    int? id,
    String? nodeId,
    String? avatarUrl,
    String? gravatarId,
    String? url,
    String? htmlUrl,
    String? followersUrl,
    String? followingUrl,
    String? gistsUrl,
    String? starredUrl,
    String? subscriptionsUrl,
    String? organizationsUrl,
    String? reposUrl,
    String? eventsUrl,
    String? receivedEventsUrl,
    String? type,
    bool? siteAdmin,
  }) {
    return Owner(
      login: login ?? this.login,
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      gravatarId: gravatarId ?? this.gravatarId,
      url: url ?? this.url,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      followersUrl: followersUrl ?? this.followersUrl,
      followingUrl: followingUrl ?? this.followingUrl,
      gistsUrl: gistsUrl ?? this.gistsUrl,
      starredUrl: starredUrl ?? this.starredUrl,
      subscriptionsUrl: subscriptionsUrl ?? this.subscriptionsUrl,
      organizationsUrl: organizationsUrl ?? this.organizationsUrl,
      reposUrl: reposUrl ?? this.reposUrl,
      eventsUrl: eventsUrl ?? this.eventsUrl,
      receivedEventsUrl: receivedEventsUrl ?? this.receivedEventsUrl,
      type: type ?? this.type,
      siteAdmin: siteAdmin ?? this.siteAdmin,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      login,
      id,
      nodeId,
      avatarUrl,
      gravatarId,
      url,
      htmlUrl,
      followersUrl,
      followingUrl,
      gistsUrl,
      starredUrl,
      subscriptionsUrl,
      organizationsUrl,
      reposUrl,
      eventsUrl,
      receivedEventsUrl,
      type,
      siteAdmin,
    ];
  }
}
