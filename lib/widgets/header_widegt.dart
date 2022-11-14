import 'package:flutter/material.dart';

import '../utils/colors.dart';

class HeaderBarWidget extends StatefulWidget with PreferredSizeWidget{
  const HeaderBarWidget({Key? key}) : super(key: key);

  @override
  State<HeaderBarWidget> createState() => _HeaderBarWidgetState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HeaderBarWidgetState extends State<HeaderBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.darkColor,
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu, color: AppColors.whiteColor,),
        ),
      ),
      title: Row(
        children: [
          Image.asset("assets/images/Disney+_Hotstar_logo.png", color: AppColors.whiteColor, scale: 6,),
        ],
      ),
      actions: const [
        IconButton(
          onPressed: null,
          icon: Icon(Icons.search, color: AppColors.whiteColor,),
        ),
      ],
    );
  }
}
