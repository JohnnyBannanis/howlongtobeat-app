class GameInfo {
  final String gameId;
  final String name;
  final String imageUrl;
  final String webLink;
  final String mainTime;
  final String mainUnit;
  final String mainLabel;
  final String extraTime;
  final String extraUnit;
  final String extraLabel;
  final String fullTime;
  final String fullUnit;
  final String fullLabel;
  final String description;
  final String rating;
  final Object moreInfo;

  GameInfo({
    this.gameId, 
    this.name, 
    this.imageUrl, 
    this.webLink, 
    this.mainTime, 
    this.mainUnit,
    this.mainLabel, 
    this.extraTime, 
    this.extraUnit,
    this.extraLabel, 
    this.fullTime, 
    this.fullUnit, 
    this.fullLabel,
    this.description,
    this.rating,
    this.moreInfo
    });

  factory GameInfo.fromJson(Map<String, dynamic> json) {
    return GameInfo(
      gameId: json['game_id'],
      name: json['game_name'],
      imageUrl: json['game_image_url'],
      webLink: json['game_web_link'],
      mainTime: json['gameplay_main'].toString(),
      mainUnit: json['gameplay_main_unit'].toString(),
      mainLabel: json['gameplay_main_label'].toString(),
      extraTime: json['gameplay_main_extra'].toString(),
      extraUnit: json['gameplay_main_extra_unit'].toString(),
      extraLabel: json['gameplay_main_extra_label'].toString(),
      fullTime: json['gameplay_completionist'].toString(),
      fullUnit: json['gameplay_completionist_unit'].toString(),
      fullLabel: json['gameplay_completionist_label'].toString(),
      description: json['description'].toString(),
      rating: json['rating'].toString().replaceAll(" Rating", "").replaceAll("%", ""),
      moreInfo: json['more_info'],
    );
  }
}
