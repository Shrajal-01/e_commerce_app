import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/auth/repository/auth.dart';
import 'package:e_commerce_app/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
