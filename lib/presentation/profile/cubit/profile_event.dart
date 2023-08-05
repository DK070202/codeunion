part of 'profile_cubit.dart';

abstract class ProfilePageEvent {
  const ProfilePageEvent();
}

class LogoutEvent extends ProfilePageEvent {
  const LogoutEvent();
}
