class SearchResult {
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

  SearchResult({
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
    this.fullLabel
    });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      gameId: json['game_id'],
      name: json['game_name'],
      imageUrl: json['game_image_url'],
      webLink: json['game_web_link'],
      mainTime: json['gameplay_main'].toString().replaceAll("-1", "-"),
      mainUnit: json['gameplay_main_unit'].toString().replaceAll("null", "-"),
      mainLabel: json['gameplay_main_label'].toString().replaceAll("null", "Main Story"),
      extraTime: json['gameplay_main_extra'].toString().replaceAll("-1", "-"),
      extraUnit: json['gameplay_main_extra_unit'].toString().replaceAll("null", "-"),
      extraLabel: json['gameplay_main_extra_label'].toString().replaceAll("null", "Main + Extra"),
      fullTime: json['gameplay_completionist'].toString().replaceAll("-1", "-"),
      fullUnit: json['gameplay_completionist_unit'].toString().replaceAll("null", "-"),
      fullLabel: json['gameplay_completionist_label'].toString().replaceAll("null", "Completionist")
    );
  }
}
