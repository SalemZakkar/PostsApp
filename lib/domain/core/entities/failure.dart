abstract class Failure {
  late String message;
}

class ServerFailure extends Failure {
  final ServerErrorCode code;
  ServerFailure({required this.code}) {
    message = getErrorText(code);
  }
}

enum ServerErrorCode {
  serverError,
  unAuth,
  noNetwork,
  forbidden,
  notFound,
  invalidData,
  wrongInput
}

String getErrorText(ServerErrorCode code) {
  switch (code) {
    case ServerErrorCode.serverError:
      return "Server Error";
    case ServerErrorCode.unAuth:
      return "You are not logged in";
    case ServerErrorCode.noNetwork:
      return "No Network";
    case ServerErrorCode.forbidden:
      return "Forbidden";
    case ServerErrorCode.notFound:
      return "Not Found";
    case ServerErrorCode.invalidData:
      return "Invalid data";
    case ServerErrorCode.wrongInput:
      return "Wrong Input";
  }
}
