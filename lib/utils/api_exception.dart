class ApiException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;
  final String? retry;

  ApiException([this.message, this.prefix, this.url, this.retry]);
}

class BadRequestException extends ApiException {
  BadRequestException([String? message, String? url]) : super(message, 'Bad Request', url);
}

class FetchDataException extends ApiException {
  FetchDataException([String? message, String? url]) : super(message, 'Unable to process', url);
}

class ApiNotRespondingException extends ApiException {
  ApiNotRespondingException([String? message, String? url]) : super(message, 'Api not responded in time', url);
}

class UnAuthorizedException extends ApiException {
  UnAuthorizedException([String? message, String? url]) : super(message, 'UnAuthorized request', url);
}

class NotAuthorizedException extends ApiException {
  NotAuthorizedException([String? message, String? url]) : super(message, 'Not Authorized request', url);
}

class NotFoundException extends ApiException {
  NotFoundException([String? message, String? url]) : super(message, 'Not Found request', url);
}

class SuspendedRequestException extends ApiException {
  SuspendedRequestException([String? message, String? url]) : super(message, 'Suspended request', url);
}

class TooManyRequestsException extends ApiException {
  TooManyRequestsException([String? message, String? url, String? retry]) : super(message, 'Too Many Attempts', url, retry);
}