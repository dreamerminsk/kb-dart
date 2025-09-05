class Wiki {
  String? title;
  String? image;
  String? description;
  DateTime? lastUpdate;
  int mviMonth = 0;

  Wiki(
      {this.title,
      this.image,
      this.description,
      this.lastUpdate,
      this.mviMonth = 0});

  Wiki.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    description = json['description'];
    lastUpdate = json['lastUpdate'];
    mviMonth = json['mviMonth'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['lastUpdate'] = this.lastUpdate;
    data['mviMonth'] = this.mviMonth;
    return data;
  }
}
