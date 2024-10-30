import 'package:flutter/material.dart';
import '../../module/colors.dart';
import '../../module/extension.dart';
import '../../module/widgets.dart';
import 'pages_ui.dart';
import 'sidebar.dart';
import 'user_info.dart';

MYBloc<int> _menu = MYBloc()..Setval(0);


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<int>(
            stream: _menu.stream,
            builder: (context, snap) {
              return !snap.hasData
                  ? MYLoader()
                  : Row(
                      children: [
                        Sidebar(
                          onchanged: (val) => _menu.Setval(val),
                          selected: _menu.val,
                        ),
                        _menu.val == 0 ? Dashboard() : Container(),
                        UserInfo()
                      ],
                    );
            }),
      ),
    );
  }
}
