import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../module/colors.dart';
import '../../module/theme.dart';
import 'class.dart';
import 'student.dart';
import 'teacher.dart';
import '../../module/widgets.dart';
import '../../module/extension.dart';

MYBloc<int> _topmenu = MYBloc()..Setval(0);

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: _topmenu.stream,
        builder: (context, snap) {
          return Container(
            width: context.width * 0.6,
            height: context.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 300,
                      child:
                          MYInput(hint: "Search", onChange: (str) {}).padding5,
                    ),
                    Row(
                      children: [
                        !context.isdark?
                        Icon(Icons.light_mode,color: Colors.yellow,):Container(),
                        MYSwitch(
                          hint: "change theme",
                            value: context.isdark,
                            onchanged: (value) {
                              context.themeBloc.SetTheme(value ? Themeenum.Dark : Themeenum.light);
                            }),
                            context.isdark?
                            Icon(Icons.dark_mode,color: Colors.blue[500],):Container(),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      hoverColor: sidebarhovercolor,
                      onTap: () {
                        _topmenu.Setval(0);
                      },
                      child: Container(
                        width: context.responsewidth(0.1, 100, 170),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: (snap.data == 0)
                                        ? selectedbackcolor
                                        : unselectedcolor,
                                    width: 3))),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Teacher").center,
                      ),
                    ),
                    InkWell(
                      hoverColor: sidebarhovercolor,
                      onTap: () {
                        _topmenu.Setval(1);
                      },
                      child: Container(
                        width: context.responsewidth(0.1, 100, 170),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: (snap.data == 1)
                                        ? selectedbackcolor
                                        : unselectedcolor,
                                    width: 3))),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Student").center,
                      ),
                    ),
                    InkWell(
                      hoverColor: sidebarhovercolor,
                      onTap: () {
                        _topmenu.Setval(2);
                      },
                      child: Container(
                        width: context.responsewidth(0.1, 100, 170),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: (snap.data == 2)
                                        ? selectedbackcolor
                                        : unselectedcolor,
                                    width: 3))),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Class").center,
                      ),
                    ),
                    Container(
                      width: context.responsewidth(0.1, 100, 170),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: unselectedcolor, width: 3))),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text("").center,
                    ).expanded,
                  ],
                ),
                snap.data == 0
                    ? Teacher()
                    : snap.data == 1
                        ? Student()
                        : snap.data == 2
                            ? Class()
                            : MYLoader()
              ],
            ),
          ).padding10.margin10;
        });
  }
}
