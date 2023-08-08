import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/model/main/ir/helpline/ir_helpline_mdl.dart';
import 'package:yatrigan/src/view/widgets/error/loading_widget.dart';

class IrHelplinesWidget extends StatefulWidget {
  const IrHelplinesWidget({Key? key}) : super(key: key);

  @override
  State<IrHelplinesWidget> createState() => _IrHelplinesWidgetState();
}

class _IrHelplinesWidgetState extends State<IrHelplinesWidget> {
  @override
  void initState() {
    getHelplinesApi();
    super.initState();
  }

  Future<void> getHelplinesApi() async {
    if (Provider.of<IrCtrl>(context, listen: false).irHelplines.isEmpty) {
      await Provider.of<IrCtrl>(context, listen: false).getHelplinesApi(
        context: context,
      );
    }
    setState(() {});
  }

  Widget body() {
    return Consumer<IrCtrl>(
      builder: (context, controller, _) {
        if (controller.irHelplines.isNotEmpty) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(
                  'Indian Railways Helplines',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
                floating: false,
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    IrHelplineMdl helpline =
                        controller.irHelplines.elementAt(index);
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            helpline.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              if (helpline.whatsApp.isNotEmpty)
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    FontAwesomeIcons.whatsapp,
                                    color: Colors.green,
                                  ),
                                ),
                              if (helpline.contactNo.isNotEmpty)
                                IconButton(
                                  onPressed: () async {
                                    final Uri launchUri = Uri(
                                      scheme: 'tel',
                                      path:
                                      '+91${controller.irShopInfo!.contactNo}',
                                    );
                                    await launchUrl(launchUri);
                                  },
                                  icon: const Icon(Icons.call),
                                ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: controller.irHelplines.length,
                ),
              ),
            ],
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: SizedBox(
          child: body(),
        ),
      ),
    );
  }
}
