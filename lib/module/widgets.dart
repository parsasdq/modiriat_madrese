import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'extension.dart';
import 'package:rxdart/rxdart.dart';

import 'colors.dart';

enum ButtonType {
  Save,
  New,
  Delete,
  Cancel,
}

class MYBloc<t> {
  BehaviorSubject<t> _bloc = BehaviorSubject();
  Stream<t> get stream => _bloc.stream;
  t get val => _bloc.value;
  void Setval(t val) => _bloc.add(val);
}

class MYButton extends StatelessWidget {
  final ButtonType? type;
  final String? tittle;
  final VoidCallback onTap;
  final Icon? icon;
  final Color? color;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  const MYButton(
      {super.key,
      required this.onTap,
      this.type,
      this.tittle,
      this.color,
      this.icon,
      this.padding,
      this.textStyle});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onTap,
        padding: this.padding == null ? EdgeInsets.all(20) : this.padding,
        color: (type == ButtonType.Save
            ? blue
            : type == ButtonType.Cancel
                ? red
                : type == ButtonType.Delete
                    ? red
                    : type == ButtonType.New
                        ? blue
                        : this.color == null
                            ? green
                            : this.color),
        child: type != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    type == ButtonType.Delete
                        ? Icons.delete
                        : type == ButtonType.New
                            ? Icons.add
                            : type == ButtonType.Cancel
                                ? Icons.cancel
                                : type == ButtonType.Save
                                    ? Icons.save
                                    : null,
                  ),
                  Text(
                      type == ButtonType.Delete
                          ? "Delete"
                          : type == ButtonType.New
                              ? "Add"
                              : type == ButtonType.Cancel
                                  ? "Cancel"
                                  : type == ButtonType.Save
                                      ? "SAve"
                                      : "$tittle",
                      style: textStyle ??
                          const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                ],
              )
            : icon != null
                ? Row(
                    children: [
                      icon!,
                      Text("$tittle",
                          style: textStyle ??
                              const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold))
                    ],
                  )
                : Text("$tittle",
                    style: textStyle ??
                        const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)));
  }
}

class MYInput extends StatelessWidget {
  final String hint;
  final Function(String)? onChange;
  final bool? autofocus;
  final bool? password;
  final TextEditingController? controller;
  final bool empty;
  const MYInput({
    super.key,
    required this.hint,
    this.empty = false,
    this.onChange,
    this.autofocus,
    this.password,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: hint,
          labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: 16)),
      obscureText:password!=null? password!:false,
      validator: (v) {
        if ((v ?? "").isEmpty && empty) {
          return "can't be empty";
        }
        return null;
      },
    );
  }
}

class MYTextButton extends StatelessWidget {
  final String tittle;
  final VoidCallback ontap;
  final Color? color;
  const MYTextButton(
      {required this.tittle, required this.ontap, this.color, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          tittle,
          style: TextStyle(color: this.color),
        ));
  }
}

class MYSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onchanged;
  final String? hint;
  const MYSwitch(
      {required this.value, required this.onchanged, this.hint, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MYBloc<bool> _vlaue = MYBloc<bool>()..Setval(this.value);
    return StreamBuilder<bool>(
        stream: _vlaue.stream,
        builder: (_, snap) {
          if (snap.hasData) {
            return this.hint != null
                ? Tooltip(
                    message: hint,
                    child: Switch(
                        value: snap.data!,
                        onChanged: (v) {
                          this.onchanged(v);
                          _vlaue.Setval(v);
                        },
                        activeColor: Colors.grey[500],hoverColor: Colors.black,thumbColor: WidgetStatePropertyAll(Colors.grey[800]),inactiveTrackColor: Colors.white,
                        ),
                  )
                : Switch(value: this.value, onChanged: this.onchanged,activeColor: Colors.grey[500],hoverColor: Colors.black,thumbColor:WidgetStatePropertyAll(Colors.grey[800]) ,inactiveTrackColor: Colors.white);
          }
          return Container();
        });
  }
}

class MYError extends StatelessWidget {
  final Exception exception;
  const MYError({required this.exception, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: red,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(this.exception.toString()),
    );
  }
}

class MYLoader extends StatelessWidget {
  const MYLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      color: green,
    );
  }
}

class MYSidebaritem extends StatelessWidget {
  final String tittle;
  final IconData? icon;
  final VoidCallback ontap;
  final int? message;
  final bool selected ;
  const MYSidebaritem(
      {required this.tittle,
      required this.selected,
      this.icon,
      required this.ontap,
      this.message,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: this.ontap,
        hoverColor: sidebarhovercolor,
        horizontalTitleGap: 7,
        titleTextStyle: TextStyle(fontSize: context.width <= 850 ? 18 : 20,color: context.secondcolor),
        title: Text(tittle),
        leading: Icon(this.icon, size: 20),
        selectedTileColor: selectedbackcolor,
        selected: this.selected,
        selectedColor: selectedcolor,
        trailing: message != null
            ? CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 15,
                child: Text(
                  message.toString(),
                  style: TextStyle(color: const Color.fromARGB(255, 68, 35, 35), fontSize: 14),
                ),
              )
            : Icon(Icons.arrow_right),
        contentPadding: context.width <= 770
            ? EdgeInsets.all(0)
            : EdgeInsets.only(left: 10));
  }
}

