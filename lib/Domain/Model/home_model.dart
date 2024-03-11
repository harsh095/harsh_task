class HomeModel {
  List<Data>? data;

  HomeModel({this.data});

  HomeModel.fromJson(List<dynamic> json) {
    if (json != null) {
      data = <Data>[];
      json.forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? avatarUrl;
  String? subscriptionsUrl;
  String? type;

  Data({
    this.id,
    this.avatarUrl,
    this.subscriptionsUrl,
    this.type,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    avatarUrl = json['avatar_url'];

    subscriptionsUrl = json['subscriptions_url'];

    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;

    data['avatar_url'] = this.avatarUrl;

    data['subscriptions_url'] = this.subscriptionsUrl;
    data['type'] = this.type;

    return data;
  }
}
