/// id : 3
/// name : "قناة القرآن الكريم"
/// url : "https://win.holol.com/live/quran/playlist.m3u8"

class Livetv {
  Livetv({
      this.id, 
      this.name, 
      this.url,});

  Livetv.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }
  int? id;
  String? name;
  String? url;
Livetv copyWith({  int? id,
  String? name,
  String? url,
}) => Livetv(  id: id ?? this.id,
  name: name ?? this.name,
  url: url ?? this.url,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['url'] = url;
    return map;
  }

}