sealed class AppError {}

class UnAuthenticatedError extends AppError {}

class SocketException extends AppError {}

class ServerException extends AppError {}
