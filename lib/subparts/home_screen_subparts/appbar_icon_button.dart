import 'package:flutter/material.dart';

import '../../utils/const.dart';

class Appbaractions extends StatelessWidget {
  const Appbaractions({super.key,required this.leaderboardclick,required this.settingclick});
  final Function leaderboardclick;
  final Function settingclick;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          AppbarIconButton(icon: Icons.download,onpressed: leaderboardclick,),
          const SizedBox(
            width: 10,
          ),
          AppbarIconButton(icon: Icons.settings,onpressed: settingclick,),
        ],
      ),
    );
  }
}

class AppbarIconButton extends StatelessWidget {
  const AppbarIconButton({super.key, required this.icon, required this.onpressed});
  final IconData icon;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: kPink),
      child: IconButton(
        padding: const EdgeInsets.all(0),
        color: Colors.white,
        onPressed: () {onpressed();},
        icon:  Icon(
          icon,
          size: 40,
        ),
      ),
    );
  }
}