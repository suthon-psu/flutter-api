class Link {
  String title;
  String imageUrl;
  String? link;
  Link({required this.title, required this.imageUrl, this.link});

  factory Link.fromJson(dynamic data) {
    return Link(
        title: data['title'], imageUrl: data['imageUrl'], link: data['link']);
  }
}
