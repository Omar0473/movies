class SetMovieWatchListRequest {
  SetMovieWatchListRequest({
      this.mediaType, 
      this.mediaId, 
      this.watchlist,
      });

  SetMovieWatchListRequest.fromJson(dynamic json) {
    mediaType = json['media_type'];
    mediaId = json['media_id'];
    watchlist = json['watchlist'];
  }
  String? mediaType;
  num? mediaId;
  bool? watchlist;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['media_type'] = mediaType;
    map['media_id'] = mediaId;
    map['watchlist'] = watchlist;
    return map;
  }

}