import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../module/colors.dart';
import '../../module/extension.dart';
import '../../module/widgets.dart';

class Sidebar extends StatelessWidget {
  Sidebar({required this.onchanged,required this.selected, Key? key}) : super(key: key);
  final Function(int) onchanged;
  final int selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.responsewidth(0.2, 150, 200),
      child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "School",
                  style: TextStyle(
                      color: context.primarycolor,
                      fontSize: context.width <= 550
                          ? 24
                          : 550 < context.width && context.width <= 850
                              ? 28
                              : 32,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 60,
                ),
                MYSidebaritem(
                  selected: this.selected == 0,
                  ontap: () {
                    onchanged(0);
                  },
                  tittle: "Dashboard",
                  icon: Icons.dashboard,
                ),
                MYSidebaritem(
                  selected: this.selected == 1,
                  ontap: () {
                    onchanged(1);
                  },
                  tittle: "Massage",
                  icon: Icons.sms,
                  message: 2,
                ),
                MYSidebaritem(
                  selected: this.selected == 2,
                  ontap: () {
                    onchanged(2);
                  },
                  tittle: "Teachers",
                  icon: Icons.person,
                ),
                MYSidebaritem(
                  selected: this.selected == 3,
                  ontap: () {
                    onchanged(3);
                  },
                  tittle: "Student",
                  icon: Icons.people,
                ),
                MYSidebaritem(
                  selected: this.selected == 4,
                  ontap: () {
                    onchanged(4);
                  },
                  tittle: "Classes",
                  icon: Icons.home_work,
                ),
                SizedBox(
                  height: 50,
                ),
                MYSidebaritem(
                  selected: this.selected == 5,
                  tittle: "Setting",
                  ontap: () {
                    onchanged(5);
                  },
                  icon: Icons.settings,
                )
              ],
            ),
    );
  }
}
