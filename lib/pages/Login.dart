import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../module/theme.dart';

import '../bloc/bloc_state.dart';
import '../module/colors.dart';
import '../module/extension.dart';
import '../module/widgets.dart';

class Login extends StatelessWidget {
  var _remember = false;
  final BlocState state;
  Login({required this.state, super.key});
  final TextEditingController _usernamectr = TextEditingController();
  final TextEditingController _passctr = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if (context.isdark) {
      context.themeBloc.SetTheme(Themeenum.light);
    }
    return Scaffold(
      body: Container(
        width: context.width * 0.3 < 350 ? 350 : context.width * 0.50,
        margin: EdgeInsets.symmetric(vertical: context.height * 0.20),
        // width: context.width * 0.3 <350 ? 350 : context.width * 0.50,
        child: AbsorbPointer(
          absorbing: state is Loading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Welcome to binary school",
                      style: TextStyle(fontSize: 25))
                  .margin10,
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    MYInput(
                      hint: 'username',
                      password: false,
                      controller: _usernamectr,
                      empty: true,
                    ).margin5,
                    MYInput(
                      hint: 'password',
                      password: true,
                      controller: _passctr,
                      empty: true,
                    ).margin5,
                    Row(
                      children: [
                        MYSwitch(
                            value: _remember,
                            hint: "save your pass for next time",
                            onchanged: (v) {
                              _remember = v;
                            }),
                        Text("save my password")
                      ],
                    ),
                  ],
                ),
              ),
              state is Loading ? MYLoader() : Container(),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                MYButton(
                        tittle: "register",
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            context.Userbloc.authenticate(
                                _usernamectr!.text.toString(),
                                _passctr!.text.toString(),
                                _remember);
                          }
                        },
                        color: red,
                        icon: const Icon(
                          Icons.app_registration,
                          color: Colors.white,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 45, vertical: 20))
                    .margin10,
                MYButton(
                  tittle: "Login",
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      context.Userbloc.authenticate(
                          _usernamectr!.text.toString(),
                          _passctr!.text.toString(),
                          _remember);
                    }
                  },
                  icon: const Icon(
                    Icons.vpn_key,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                ).margin10,
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MYTextButton(tittle: "forgot password", ontap: () {}),
                ],
              ),
              state is Failed
                  ? Container(
                      decoration: BoxDecoration(
                        color: red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        (state as Failed).exception.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ).margin15.padding15
                  : Container(),
              state is Failed
                  ? MYError(exception: (state as Failed).exception)
                  : Container(),
            ],
          ),
        ),
      ).center.card.padding10,
    );
  }
}
