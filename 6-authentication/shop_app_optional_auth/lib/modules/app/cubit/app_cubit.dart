import 'package:bloc/bloc.dart';
import '/domains/user/user_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  //
  final UserRepository _userRepo;

  AppCubit({required UserRepository userRepo})
      : _userRepo = userRepo,
        super(AppState.init(jwtAuth: userRepo.checkJwtAuth())) {
    onInit();
  }

  void onInit() {
    _userRepo.jwtAuthStream.listen(
      (event) {
        emit(state.copyWith(jwtAuth: event));
      },
    );
  }

  void onLogout() {
    _userRepo.logout();
  }
}
