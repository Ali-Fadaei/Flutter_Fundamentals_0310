class BusinessResponse {
  //
  final bool result;

  final int status;

  final dynamic data;

  final BusinessResponseMessage? message;

  const BusinessResponse({
    required this.result,
    required this.status,
    required this.message,
    required this.data,
  });

  factory BusinessResponse.fromMap(Map<String, dynamic> map) {
    return BusinessResponse(
      result: map['result'],
      status: map['status'],
      message: map['message'] == null
          ? null
          : BusinessResponseMessage.fromMap(
              map['message'],
            ),
      data: map['data'],
    );
  }
}

class BusinessResponseMessage {
  //
  final String general;

  final dynamic validation;

  const BusinessResponseMessage({
    required this.general,
    required this.validation,
  });

  factory BusinessResponseMessage.fromMap(Map<String, dynamic> map) {
    return BusinessResponseMessage(
      general: map['general'],
      validation: map['validation'],
    );
  }
}
