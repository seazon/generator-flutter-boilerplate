class GithubUserResult {
  bool incomplete_results;
  List<GithubUserResultItem> items;
  int total_count;

  GithubUserResult({this.incomplete_results, this.items, this.total_count});

  factory GithubUserResult.fromJson(Map<String, dynamic> json) {
    return GithubUserResult(
      incomplete_results: json['incomplete_results'],
      items: json['items'] != null
          ? (json['items'] as List).map((i) => GithubUserResultItem.fromJson(i)).toList()
          : null,
      total_count: json['total_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['incomplete_results'] = this.incomplete_results;
    data['total_count'] = this.total_count;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class GithubUserResultItem {
  String avatar_url;
  String events_url;
  String followers_url;
  String following_url;
  String gists_url;
  String gravatar_id;
  String html_url;
  int id;
  String login;
  String node_id;
  String organizations_url;
  String received_events_url;
  String repos_url;
  double score;
  bool site_admin;
  String starred_url;
  String subscriptions_url;
  String type;
  String url;

  GithubUserResultItem(
      {this.avatar_url,
      this.events_url,
      this.followers_url,
      this.following_url,
      this.gists_url,
      this.gravatar_id,
      this.html_url,
      this.id,
      this.login,
      this.node_id,
      this.organizations_url,
      this.received_events_url,
      this.repos_url,
      this.score,
      this.site_admin,
      this.starred_url,
      this.subscriptions_url,
      this.type,
      this.url});

  factory GithubUserResultItem.fromJson(Map<String, dynamic> json) {
    return GithubUserResultItem(
      avatar_url: json['avatar_url'],
      events_url: json['events_url'],
      followers_url: json['followers_url'],
      following_url: json['following_url'],
      gists_url: json['gists_url'],
      gravatar_id: json['gravatar_id'],
      html_url: json['html_url'],
      id: json['id'],
      login: json['login'],
      node_id: json['node_id'],
      organizations_url: json['organizations_url'],
      received_events_url: json['received_events_url'],
      repos_url: json['repos_url'],
      score: json['score'],
      site_admin: json['site_admin'],
      starred_url: json['starred_url'],
      subscriptions_url: json['subscriptions_url'],
      type: json['type'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar_url'] = this.avatar_url;
    data['events_url'] = this.events_url;
    data['followers_url'] = this.followers_url;
    data['following_url'] = this.following_url;
    data['gists_url'] = this.gists_url;
    data['gravatar_id'] = this.gravatar_id;
    data['html_url'] = this.html_url;
    data['id'] = this.id;
    data['login'] = this.login;
    data['node_id'] = this.node_id;
    data['organizations_url'] = this.organizations_url;
    data['received_events_url'] = this.received_events_url;
    data['repos_url'] = this.repos_url;
    data['score'] = this.score;
    data['site_admin'] = this.site_admin;
    data['starred_url'] = this.starred_url;
    data['subscriptions_url'] = this.subscriptions_url;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}
