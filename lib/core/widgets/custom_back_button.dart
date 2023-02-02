import 'package:bookly_app/config/icons/icons_broken.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        IconBroken.Arrow___Left_2,
        size: 30,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
