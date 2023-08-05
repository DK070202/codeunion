import 'package:bloc/bloc.dart';
import 'package:codeunion/domain/auth/repository/auth_repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfilePageCubit extends Cubit<ProfilePageState> {
  ProfilePageCubit(this.authRepository) : super(ProfilePageInitial());
  final AuthRepository authRepository;
}
