import 'package:bloc/bloc.dart';
import 'package:shop_app_optional_auth/domains/app/app_repository.dart';
import '/domains/user/user_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  //
  final AppRepository _appRepo;

  final UserRepository _userRepo;

  AppCubit({
    required AppRepository appRepo,
    required UserRepository userRepo,
  })  : _appRepo = appRepo,
        _userRepo = userRepo,
        super(
          AppState.init(
            themeId: appRepo.readTheme(),
            jwtAuth: userRepo.checkJwtAuth(),
          ),
        ) {
    onInit();
  }

  void onInit() {
    _userRepo.jwtAuthStream.listen(
      (event) {
        emit(state.copyWith(jwtAuth: event));
      },
    );
  }

  void changeTheme(int themeId) {
    _appRepo.updateTheme(themeId);
    emit(state.copyWith(themeId: _appRepo.readTheme()));
  }

  void onLogout() {
    _userRepo.logout();
  }
}
