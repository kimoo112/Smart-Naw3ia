import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cache/cache_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Map<String, String> _validUsers = {
    '30311080203098': 'كريم محمد السيد',
    '12345678': 'محمد أحمد',
    '87654321': 'سارة علي',
    '20230001': 'ياسر جمال',
    '20230002': 'هالة محمود',
    '20230003': 'زياد أحمد',
  };

  LoginCubit() : super(LoginInitial());

  Future<void> login(String username, String password) async {
    try {
      emit(LoginLoading());

      if (username.isEmpty || password.isEmpty) {
        emit(const LoginError('الرجاء إدخال رقم الطالب وكلمة المرور'));
        return;
      }

      if (!RegExp(r'^\d{14}$').hasMatch(username)) {
        emit(const LoginError('رقم الطالب يجب أن يكون 14 أرقام'));
        return;
      }

      await Future.delayed(const Duration(seconds: 2));

      if (_validUsers.containsKey(username)) {
        final studentName = _validUsers[username]!;

        // Save username and name in shared preferences
        await CacheHelper.saveData(key: 'studentNumber', value: username);
        await CacheHelper.saveData(key: 'studentName', value: studentName);

        emit(LoginSuccess());
      } else {
        emit(const LoginError('رقم الطالب غير صحيح'));
      }
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  void reset() {
    emit(LoginInitial());
  }
}
