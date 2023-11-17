import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileMenuwidget extends StatelessWidget {
  ProfileMenuwidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed,
      this.endIcon = true,
      this.textcolor});

  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool endIcon;
  final Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onPressed,
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color.fromARGB(255, 127, 126, 126).withOpacity(0.1)),
          child: Icon(
            icon,
            color: Color.fromARGB(255, 13, 89, 152),
          ),
        ),
        title: Text(title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.apply(color: textcolor)),
        trailing: endIcon
            ? Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromARGB(255, 127, 126, 126)
                        .withOpacity(0.1)),
                child: const Icon(
                  LineAwesomeIcons.angle_right,
                  size: 18,
                  color: Colors.grey,
                ),
              )
            : null);
  }
}
