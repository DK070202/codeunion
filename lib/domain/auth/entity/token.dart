class TokensEntity {
  const TokensEntity({
    required this.refreshToken,
    required this.accessToken,
  });

  final String refreshToken;
  final String accessToken;
}
