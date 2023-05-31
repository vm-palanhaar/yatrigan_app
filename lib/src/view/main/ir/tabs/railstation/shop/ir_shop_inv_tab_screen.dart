import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/model/main/ir/railstation/shop/shop_inv_mdl.dart';
import 'package:yatrigan/src/view/widgets/buttons/shop_inv_prod_button_widget.dart';
import 'package:yatrigan/src/view/widgets/error/error_text_widget.dart';
import 'package:yatrigan/src/view/widgets/error/loading_widget.dart';

class IrShopInvTabScreen extends StatefulWidget {
  const IrShopInvTabScreen({Key? key}) : super(key: key);

  @override
  State<IrShopInvTabScreen> createState() => _IrShopInvTabScreenState();
}

class _IrShopInvTabScreenState extends State<IrShopInvTabScreen> {
  @override
  void initState() {
    getRailStationShopInvApi();
    super.initState();
  }

  void getRailStationShopInvApi() async {
    if (Provider.of<IrCtrl>(context, listen: false).irShopInv == null ||
        Provider.of<IrCtrl>(context, listen: false).irShopInv!.shopId !=
            Provider.of<IrCtrl>(context, listen: false).irShop!.id) {
      await Provider.of<IrCtrl>(context, listen: false)
          .getRailStationShopInvApi(
        context: context,
      );
    }
  }

  Future<void> onRefresh() async {
    Provider.of<IrCtrl>(context, listen: false).irShopInv = null;
    getRailStationShopInvApi();
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
              if (controller.irShopInv != null) {
                if (controller.irShopInv!.shopId == controller.irShop!.id) {
                  if (controller.irShopInv!.inv.isNotEmpty) {
                    return ListView.builder(
                      itemCount: controller.irShopInv!.inv.length,
                      itemBuilder: (context, index) {
                        ShopInvMdl prod =
                            controller.irShopInv!.inv.elementAt(index);
                        return ShopInvProdButtonWidget(
                          key: ObjectKey(prod),
                          prod: prod.prod,
                        );
                      },
                    );
                  } else {
                    return ErrorTextWidget(
                      errorText: controller.irShopInv!.error,
                    );
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
