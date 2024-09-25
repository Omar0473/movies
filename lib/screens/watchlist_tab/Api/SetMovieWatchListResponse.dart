class SetMovieWatchListResponse {
  SetMovieWatchListResponse({
      this.statusCode, 
      this.statusMessage, 
      this.success,});

  SetMovieWatchListResponse.fromJson(dynamic json) {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    success = json['success'];
  }
  num? statusCode;
  String? statusMessage;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_code'] = statusCode;
    map['status_message'] = statusMessage;
    map['success'] = success;
    return map;
  }

}