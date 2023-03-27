import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';

class IrStationShopDetailsScreen extends StatefulWidget {
  const IrStationShopDetailsScreen({Key? key}) : super(key: key);
  static String id = 'IrStationShopDetailsScreen';

  @override
  State<IrStationShopDetailsScreen> createState() =>
      _IrStationShopDetailsScreenState();
}

class _IrStationShopDetailsScreenState
    extends State<IrStationShopDetailsScreen> {
  Icon _payment(bool paymentMethod) {
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
      appBar: AppBar(
        title: Text(Provider.of<IrCtrl>(context, listen: false)
            .irStationShopDetails!
            .getName),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.03,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Column(
            children: [
              Card(
                child: Image.network(
                  Provider.of<IrCtrl>(context, listen: false)
                      .irStationShopDetails!
                      .getImage,
                ),
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                    vertical: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Shop'),
                        trailing: Text(
                            Provider.of<IrCtrl>(context, listen: false)
                                .irStationShopDetails!
                                .getName),
                      ),
                      ListTile(
                        title: const Text('Station'),
                        trailing: Text(
                            Provider.of<IrCtrl>(context, listen: false)
                                .irStationShopDetails!
                                .getStation),
                      ),
                      if (Provider.of<IrCtrl>(context, listen: false)
                              .irStationShopDetails!
                              .getPltA
                              .isNotEmpty &&
                          Provider.of<IrCtrl>(context, listen: false)
                              .irStationShopDetails!
                              .getPltB
                              .isEmpty)
                        ListTile(
                          title: const Text('Platform'),
                          trailing: Text(
                              Provider.of<IrCtrl>(context, listen: false)
                                  .irStationShopDetails!
                                  .getPltA),
                        ),
                      if (Provider.of<IrCtrl>(context, listen: false)
                              .irStationShopDetails!
                              .getPltA
                              .isEmpty &&
                          Provider.of<IrCtrl>(context, listen: false)
                              .irStationShopDetails!
                              .getPltB
                              .isNotEmpty)
                        ListTile(
                          title: const Text('Platform'),
                          trailing: Text(
                              Provider.of<IrCtrl>(context, listen: false)
                                  .irStationShopDetails!
                                  .getPltB),
                        ),
                      if (Provider.of<IrCtrl>(context, listen: false)
                              .irStationShopDetails!
                              .getPltA
                              .isNotEmpty &&
                          Provider.of<IrCtrl>(context, listen: false)
                              .irStationShopDetails!
                              .getPltB
                              .isNotEmpty)
                        ListTile(
                          title: const Text('Platform'),
                          trailing: Text(
                              '${Provider.of<IrCtrl>(context, listen: false).irStationShopDetails!.getPltA}, '
                              '${Provider.of<IrCtrl>(context, listen: false).irStationShopDetails!.getPltB}'),
                        ),
                      ListTile(
                        onTap: () async {
                          final Uri launchUri = Uri(
                            scheme: 'tel',
                            path:
                                '+91${Provider.of<IrCtrl>(context, listen: false).irStationShopDetails!.getContactNo}',
                          );
                          await launchUrl(launchUri);
                        },
                        title: const Text('Contact Number'),
                        subtitle: Text(
                            '+91 ${Provider.of<IrCtrl>(context, listen: false).irStationShopDetails!.getContactNo}'),
                        trailing: const Icon(Icons.call),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01,
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
                        trailing: _payment(
                            Provider.of<IrCtrl>(context, listen: false)
                                .irStationShopDetails!
                                .getIsCard),
                      ),
                      ListTile(
                        title: const Text('Card'),
                        trailing: _payment(
                            Provider.of<IrCtrl>(context, listen: false)
                                .irStationShopDetails!
                                .getIsCard),
                      ),
                      ListTile(
                        title: const Text('UPI'),
                        trailing: _payment(
                            Provider.of<IrCtrl>(context, listen: false)
                                .irStationShopDetails!
                                .getIsUpi),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
