import 'package:doctor/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomerAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomerAppBar({
    super.key,
    this.appTitle,
    this.route,
    this.icon,
    this.actions,
  });

  final String? appTitle;
  final String? route;
  final FaIcon? icon;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  State<CustomerAppBar> createState() => _CustomerAppBarState();
}


class _CustomerAppBarState extends State<CustomerAppBar> {
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(widget.appTitle!, style: const TextStyle(color: Colors.black, fontSize: 20),),
      leading: widget.icon != null 
        ? Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Config.primaryColor
          ),
          child: IconButton(
            icon: widget.icon!,
            iconSize: 16,
            color: Colors.white,
            onPressed: (){

              if(widget.route != null){
                Navigator.of(context).pushNamed(widget.route!);
              }else{
                Navigator.of(context).pop();
              }
          },),
        )
        : null,
      actions: widget.actions ?? [],  
    );
  }
}