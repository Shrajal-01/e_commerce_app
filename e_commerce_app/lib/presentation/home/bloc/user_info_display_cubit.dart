import 'package:e_commerce_app/domain/auth/usecases/get_user.dart';
import 'package:e_commerce_app/presentation/home/bloc/user_info_display_state.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit() : super(UserInfoLoading());

  void displayUserInfo() async {
    var returnedData = await sl<GetUserUseCase>().call();
    returnedData.fold(
      (error) {
        emit(LoadUserInfoFailure());
      },
      (data) {
        emit(UserInfoLoaded(user: data));
      },
    );
  }
}
