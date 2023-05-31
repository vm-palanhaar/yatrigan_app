import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/model/main/ir/railstation/ir_shops_mdl.dart';
import 'package:yatrigan/src/view/main/ir/widgets/railstation/shop/ir_shop_button_widget.dart';
import 'package:yatrigan/src/view/widgets/error/error_text_widget.dart';
import 'package:yatrigan/src/view/widgets/error/loading_widget.dart';

class IrRailStationShopsTabScreen extends StatefulWidget {
  const IrRailStationShopsTabScreen({Key? key}) : super(key: key);

  @override
  State<IrRailStationShopsTabScreen> createState() =>
      _IrRailStationShopsTabScreenState();
}

class _IrRailStationShopsTabScreenState
    extends State<IrRailStationShopsTabScreen> {
  @override
  void initState() {
    getRailStationShopsApi();
    super.initState();
  }

  Future<void> getRailStationShopsApi() async {
    if (Provider.of<IrCtrl>(context, listen: false).irShops == null ||
        Provider.of<IrCtrl>(context, listen: false).irShops!.station !=
            Provider.of<IrCtrl>(context, listen: false).railStationCode) {
      await Provider.of<IrCtrl>(context, listen: false).getRailStationShopsApi(
        context: context,
      );
    }
  }

  Future<void> onRefresh() async {
    Provider.of<IrCtrl>(context, listen: false).irShops = null;
    getRailStationShopsApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: Consumer<IrCtrl>(
            builder: (context, controller, _) {
              if (controller.irShops != null) {
                if (controller.irShops!.station == controller.railStationCode) {
                  if (controller.irShops!.shops.isNotEmpty) {
                    return ListView.builder(
                      itemCount: controller.irShops!.shops.length,
                      itemBuilder: (context, index) {
                        IrShopMdl shop =
                            controller.irShops!.shops.elementAt(index);
                        return IrShopButtonWidget(
                          key: ObjectKey(shop),
                          shop: shop,
                        );
                      },
                    );
                  } else {
                    return ErrorTextWidget(
                        errorText: controller.irShops!.error);
                  }
                } else {
                  return const LoadingWidget();
                }
              } else {
                return const LoadingWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}
