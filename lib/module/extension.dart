import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/theme_bloc.dart';
import '../bloc/user_bloc.dart';
import '../model/user_model.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double responsewidth(double percent, double min, double max) =>
      MediaQuery.of(this).size.width * percent < min
          ? min
          : MediaQuery.of(this).size.width * percent > max
              ? max
              : MediaQuery.of(this).size.width * percent;
  double get height => MediaQuery.of(this).size.height;
  void push(Widget child) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (ctx) => child));
  UserBloc get Userbloc => read<UserBloc>();
  UserModel? get user => read<UserBloc>().user;
  bool get isdark => Theme.of(this).brightness == Brightness.dark;
  ThemeBloc get themeBloc => this.read<ThemeBloc>();
  Color get primarycolor => Theme.of(this).primaryColor;
  Color get secondcolor => Theme.of(this).hintColor;
}

extension WidgetsExtension on Widget {
  //margin
  Widget get vmargin5 =>
      Container(margin: const EdgeInsets.symmetric(vertical: 5), child: this);
  Widget get vmargin10 =>
      Container(margin: const EdgeInsets.symmetric(vertical: 10), child: this);
  Widget get vmargin15 =>
      Container(margin: const EdgeInsets.symmetric(vertical: 15), child: this);
  Widget get margin5 => Container(margin: const EdgeInsets.all(5), child: this);
  Widget get margin10 =>
      Container(margin: const EdgeInsets.all(10), child: this);
  Widget get margin15 =>
      Container(margin: const EdgeInsets.all(15), child: this);
  Widget get hmargin5 =>
      Container(margin: const EdgeInsets.symmetric(horizontal: 5), child: this);
  Widget get hmargin10 => Container(
      margin: const EdgeInsets.symmetric(horizontal: 10), child: this);
  Widget get hmargin15 => Container(
      margin: const EdgeInsets.symmetric(horizontal: 15), child: this);
//pading
  Widget get vpadding5 =>
      Container(padding: const EdgeInsets.symmetric(vertical: 5), child: this);
  Widget get vpadding10 =>
      Container(padding: const EdgeInsets.symmetric(vertical: 10), child: this);
  Widget get vpadding15 =>
      Container(padding: const EdgeInsets.symmetric(vertical: 15), child: this);
  Widget get padding5 =>
      Container(padding: const EdgeInsets.all(5), child: this);
  Widget get padding10 =>
      Container(padding: const EdgeInsets.all(10), child: this);
  Widget get padding15 =>
      Container(padding: const EdgeInsets.all(15), child: this);
  Widget get hpadding5 => Container(
      padding: const EdgeInsets.symmetric(horizontal: 5), child: this);
  Widget get hpadding10 => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10), child: this);
  Widget get hpadding15 => Container(
      padding: const EdgeInsets.symmetric(horizontal: 15), child: this);
  //card expand
  Widget get card => Card(
        color: Colors.grey.shade200,
        child: this,
      );
  Widget get expanded => Expanded(child: this);
  Widget get center => Center(child: this);
}
