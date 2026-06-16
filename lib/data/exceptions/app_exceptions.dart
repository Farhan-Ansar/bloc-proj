class AppExceptions implements Exception {
  final String? _message;
  final String? _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return "${_prefix ?? ''}${_message ?? 'Something went wrong'}";
  }
}

class NoInternetException extends AppExceptions {
  NoInternetException([String? message])
    : super(message ?? 'No Internet Connection', 'Connection Error: ');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
    : super(message ?? 'Unable to fetch data', 'Network Error: ');
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message])
    : super(message ?? 'Invalid request', 'Bad Request: ');
}

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? message])
    : super(message ?? 'Unauthorised access', 'Unauthorised: ');
}

class NotFoundException extends AppExceptions {
  NotFoundException([String? message])
    : super(message ?? 'Resource not found', '404 Not Found: ');
}

class InternalServerException extends AppExceptions {
  InternalServerException([String? message])
    : super(message ?? 'Internal server error', 'Server Error: ');
}
