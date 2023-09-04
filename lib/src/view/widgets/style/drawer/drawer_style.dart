import 'package:flutter/material.dart';
import 'package:yatrigan/src/view/util/enum_icons.dart';


class CustomDrawer extends StatelessWidget {
  final List<Widget> children;
  const CustomDrawer({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        color: Theme.of(context).colorScheme.surface,
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.01,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerLogo extends StatelessWidget {
  const DrawerLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.02,
        right: MediaQuery.of(context).size.width * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Image.asset(
        'images/main/yatrigan_drawer_logo.png',
        height: MediaQuery.of(context).size.height * 0.04,
      ),
    );
  }
}

class ListTileLIconTText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  const ListTileLIconTText({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}

class ListTileTTextTIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  const ListTileTTextTIcon({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Icon(icon),
      onTap: () {
        onTap();
      },
    );
  }
}

class ListTileLIconTTextTIcon extends StatelessWidget {
  final IconData lIcon;
  final String text;
  final Function onTap;
  final IconData tIcon;
  const ListTileLIconTTextTIcon({
    Key? key,
    required this.lIcon,
    required this.text,
    required this.onTap,
    required this.tIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(lIcon),
      title: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        onTap();
      },
      trailing: Icon(tIcon),
    );
  }
}

class ListTileLText extends StatelessWidget {
  final String text;
  final Function onTap;
  const ListTileLText({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}

class ListTileLWidgetTText extends StatelessWidget {
  final Widget child;
  final String text;
  final Function onTap;
  const ListTileLWidgetTText({
    Key? key,
    required this.child,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: child,
      title: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}

class ListTileTTextTWidget extends StatelessWidget {
  final Widget child;
  final String text;
  final Function onTap;
  const ListTileTTextTWidget({
    Key? key,
    required this.child,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: child,
      onTap: () {
        onTap();
      },
    );
  }
}
Widget listTileHelp() {
  return ListTileLIconTText(
    icon: AppIcon.help.icon,
    text: 'Help',
    onTap: () {
      //TODO: Develop Screen and API for Help Section
    },
  );
}

Widget listTileFeedback() {
  return ListTileLIconTText(
    icon: AppIcon.feedback.icon,
    text: 'Feedback',
    onTap: () {
      //TODO: Navigate to Feedback Screen
    },
  );
}
