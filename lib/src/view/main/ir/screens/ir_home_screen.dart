import 'package:flutter/material.dart';
import 'package:yatrigan/src/view/main/ir/tabs/ir_home_equiry_options_tab_screen.dart';
import 'package:yatrigan/src/view/main/ir/tabs/ir_home_help_options_tab_screen.dart';
import 'package:yatrigan/src/view/main/ir/tabs/ir_home_retail_options_tab_screen.dart';

class IrHomeScreen extends StatefulWidget {
  const IrHomeScreen({Key? key}) : super(key: key);
  static String id = 'IrHomeScreen';

  @override
  State<IrHomeScreen> createState() => _IrHomeScreenState();
}

class _IrHomeScreenState extends State<IrHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Indian Railways'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.train_rounded),
            ),
          ],
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.question_answer_rounded),
                text: 'Enquiry',
              ),
              Tab(
                icon: Icon(Icons.food_bank),
                text: 'Retail',
              ),
              Tab(
                icon: Icon(Icons.help),
                text: 'Help',
              ),
            ],
          ),
        ),
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.5,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: Image.asset(
                    'images/ic_launcher.png',
                    height: MediaQuery.of(context).size.height * 0.18,
                  ),
                ),
                Divider(
                  thickness: MediaQuery.of(context).size.height * 0.005,
                  indent: MediaQuery.of(context).size.width * 0.03,
                  endIndent: MediaQuery.of(context).size.width * 0.03,
                ),
                const ListTile(
                  leading: Icon(Icons.train_rounded),
                  title: Text('Indian Railways'),
                ),
                Divider(
                  thickness: MediaQuery.of(context).size.height * 0.005,
                  indent: MediaQuery.of(context).size.width * 0.03,
                  endIndent: MediaQuery.of(context).size.width * 0.03,
                ),
                ListTile(
                  leading: const Icon(Icons.save),
                  title: const Text('Tickets'),
                  onTap: (){},
                ),
                ListTile(
                  leading: const Icon(Icons.handshake),
                  title: const Text('Contributions'),
                  onTap: (){},
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Profile'),
                  onTap: (){},
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            IrHomeEnquiryOptionsTabScreen(),
            IrHomeRetailOptionsTabScreen(),
            IrHomeHelpOptionsTabScreen(),
          ],
        ),
      ),
    );
  }
}
