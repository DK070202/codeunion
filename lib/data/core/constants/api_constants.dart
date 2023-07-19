class ApiConstants {
  const ApiConstants._();

  static const login = '/v1/auth/login';
  static const refreshToken = '/v1/auth/login/refresh';
  static const profile = '/v1/auth/login/profile';
  static const hostUrl = String.fromEnvironment('HOST_URL');
}
