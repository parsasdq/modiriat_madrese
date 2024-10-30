import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/repository/user_repository.dart';
import '/model/user_model.dart';
import 'bloc_state.dart';

class UserBloc extends Cubit<BlocState> {
  UserBloc() : super(Initial()) {
    SharedPreferences.getInstance().then((val) {
      String token = val.getString("token") ?? "";
      if (token.isNotEmpty) {
        verifyByToken(token);
      }
    });
  }
  UserModel? _user;

  void authenticate(String mobile, String pass, bool remember) async {
    if (state is Loading) return;
    try {
      emit(Loading());
      _user = await UserRepository().authenticate(mobile, pass);
      if (remember) {
        SharedPreferences.getInstance()
            .then((v) => v.setString("token", _user!.token!));
      }
      emit(Authenticated(_user!));
    } catch (e) {
      emit(Failed(e as Exception));
    }
  }

  void logout() async{
    emit(Initial());
    await SharedPreferences.getInstance().then((v)=> v.remove("token"));
  }

  UserModel? get user => _user;

  void verifyByToken(String token) async {
    if (state is Loading) return;
    try {
      emit(Loading());
      _user = await UserRepository().verifyByToken(token);

      emit(Authenticated(_user!));
    } catch (e) {
      emit(Failed(e as Exception));
    }
  }
}
