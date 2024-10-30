import 'package:bloc/bloc.dart';
import 'bloc_state.dart';
import '../module/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends Cubit<ThemeState> {
  ThemeBloc() : super(ThemeState(Themeenum.light)) {
    LoadTheme();
  }
  void LoadTheme() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    String? _str = await _pref.getString("theme");
    if (_str == "dark") {
      emit(ThemeState(Themeenum.Dark));
    }
  }

  void SetTheme(Themeenum theme) async {
    emit(ThemeState(theme));
    await SharedPreferences.getInstance().then((val) =>
        val.setString("theme", theme == Themeenum.Dark ? "dark" : "light"));
  }
}
