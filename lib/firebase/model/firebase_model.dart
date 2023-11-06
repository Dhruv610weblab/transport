class FireTokenModel {
  final bool? success;
  final String? message;

  FireTokenModel({
    this.success,
    this.message,
  });

  FireTokenModel copyWith({
    bool? success,
    String? message,
  }) {
    return FireTokenModel(
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }

  FireTokenModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as bool?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'success' : success,
    'message' : message
  };
}