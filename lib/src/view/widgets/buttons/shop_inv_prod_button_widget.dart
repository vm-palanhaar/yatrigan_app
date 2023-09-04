import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/productcatalog/product_catalog_ctrl.dart';
import 'package:yatrigan/src/model/main/product/product_list_model.dart';
import 'package:yatrigan/src/view/main/productcatalog/screens/product_details_screen.dart';

class ShopInvProdButtonWidget extends StatelessWidget {
  final ProductListModel? prod;
  const ShopInvProdButtonWidget({
    Key? key,
    this.prod,
  }) : super(key: key);

  Text productName(ProductListModel product) {
    if (product.getBrand.isEmpty) {
      return Text(
        product.getName,
        textDirection: TextDirection.ltr,
      );
    } else {
      return Text(
        '${product.getBrand} ${product.getName}',
        textDirection: TextDirection.ltr,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Change implementation for the display of category logo
    String image = '';
    if (prod!.getCategory == 'Food and Drink (Non-Veg)') {
      image = 'images/main/product/non_veg_logo.png';
    } else if (prod!.getCategory == 'Food and Drink (Veg)') {
      image = 'images/main/product/veg_logo.png';
    }
    return Card(
      child: ListTile(
        key: ObjectKey(prod),
        leading: Image.network(
          prod!.getImage,
          width: MediaQuery.of(context).size.width * 0.21,
        ),
        title: productName(prod!),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '₹ ${prod!.getPrice}',
            ),
            Text(
              'Net Weight: ${prod!.getNetWeight}',
            ),
          ],
        ),
        trailing: image.isNotEmpty
            ? Image.asset(
          image,
          height: MediaQuery.of(context).size.height * 0.025,
        )
            : const SizedBox(),
        enableFeedback: true,
        dense: true,
        onTap: () async {
          await Provider.of<PcCtrl>(context, listen: false)
              .getProductDetailsApi(
            context: context,
            productId: prod!.getId,
          );
          if (Provider.of<PcCtrl>(context, listen: false).product != null) {
            Navigator.pushNamed(context, ProductDetailsScreen.id);
          }
        },
      ),
    );
  }
}
