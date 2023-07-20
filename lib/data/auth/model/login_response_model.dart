import 'package:codeunion/data/user/model/user_model.dart';
import 'package:codeunion/domain/auth/entity/login_response.dart';
import 'package:codeunion/domain/auth/entity/token.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable(createToJson: false)
class LoginResponseModel extends LoginResponseEntity {
  const LoginResponseModel({
    required this.tokens,
    required this.user,
  }) : super(tokens: tokens, user: user);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  @override
  final TokensModel tokens;

  @override
  final UserModel user;
}

@JsonSerializable()
class TokensModel extends TokensEntity {
  const TokensModel({
    required this.accessToken,
    required this.refreshToken,
  }) : super(accessToken: accessToken, refreshToken: refreshToken);

  factory TokensModel.fromJson(Map<String, dynamic> json) =>
      _$TokensModelFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;

  Map<String, dynamic> toJson() => _$TokensModelToJson(this);
}
