import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/view/widgets/error/loading_widget.dart';

class IrShopInfoTabScreen extends StatefulWidget {
  const IrShopInfoTabScreen({Key? key}) : super(key: key);

  @override
  State<IrShopInfoTabScreen> createState() => _IrShopInfoTabScreenState();
}

class _IrShopInfoTabScreenState extends State<IrShopInfoTabScreen> {
  @override
  void initState() {
    getRailStationShopInfoApi();
    super.initState();
  }

  Future<void> getRailStationShopInfoApi() async {
    if (Provider.of<IrCtrl>(context, listen: false).irShopInfo == null ||
        Provider.of<IrCtrl>(context, listen: false).irShopInfo!.id !=
            Provider.of<IrCtrl>(context, listen: false).irShop!.id) {
      await Provider.of<IrCtrl>(context, listen: false)
          .getRailStationShopInfoApi(
        context: context,
      );
      setState(() {});
    }
  }

  Icon pmt(bool paymentMethod) {
    if (paymentMethod) {
      return const Icon(
        Icons.check_rounded,
        color: Colors.green,
      );
    }
    return const Icon(
      Icons.close,
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.03,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Consumer<IrCtrl>(
            builder: (context, controller, _) {
              if (controller.irShopInfo != null) {
                if (controller.irShopInfo!.id == controller.irShop!.id) {
                  return Column(
                    children: [
                      Card(
                        child: Image.network(
                          controller.irShopInfo!.image,
                        ),
                      ),
                      Card(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.01,
                            vertical: MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: const Text('Station'),
                                trailing: Text(controller.irShopInfo!.station),
                              ),
                              if (controller.irShopInfo!.pltA.isNotEmpty &&
                                  controller.irShopInfo!.pltB.isEmpty)
                                ListTile(
                                  title: const Text('Platform'),
                                  trailing: Text(controller.irShopInfo!.pltA),
                                ),
                              if (controller.irShopInfo!.pltA.isEmpty &&
                                  controller.irShopInfo!.pltB.isNotEmpty)
                                ListTile(
                                  title: const Text('Platform'),
                                  trailing: Text(controller.irShopInfo!.pltB),
                                ),
                              if (controller.irShopInfo!.pltA.isNotEmpty &&
                                  controller.irShopInfo!.pltB.isNotEmpty)
                                ListTile(
                                  title: const Text('Platform'),
                                  trailing:
                                      Text('${controller.irShopInfo!.pltA}, '
                                          '${controller.irShopInfo!.pltB}'),
                                ),
                              ListTile(
                                onTap: () async {
                                  final Uri launchUri = Uri(
                                    scheme: 'tel',
                                    path:
                                        '+91${controller.irShopInfo!.contactNo}',
                                  );
                                  await launchUrl(launchUri);
                                },
                                title: const Text('Contact Number'),
                                subtitle: Text(
                                    '+91 ${controller.irShopInfo!.contactNo}'),
                                trailing: const Icon(Icons.call),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.01,
                            vertical: MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Payment Methods',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ListTile(
                                title: const Text('Cash'),
                                trailing: pmt(controller.irShopInfo!.getIsCash),
                              ),
                              ListTile(
                                title: const Text('Card'),
                                trailing: pmt(controller.irShopInfo!.getIsCard),
                              ),
                              ListTile(
                                title: const Text('UPI'),
                                trailing: pmt(controller.irShopInfo!.getIsUpi),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const LoadingWidget();
                }
              } else {
                return const LoadingWidget();
              }
            },
          ),
          /*child: */
        ),
      ),
    );
  }
}
