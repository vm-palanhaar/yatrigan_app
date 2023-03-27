import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/productcatalog/product_catalog_ctrl.dart';
import 'package:yatrigan/src/model/main/product/product_list_model.dart';
import 'package:yatrigan/src/view/main/productcatalog/screens/product_details_screen.dart';

class ShopInvProductButtonWidget extends StatelessWidget {
  final ProductListModel? invProduct;
  const ShopInvProductButtonWidget({
    Key? key,
    this.invProduct,
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
    //TODO: Include food veg/non-veg icon
    String foodImage = '';
    if (invProduct!.getCategory.contains('Food')) {
      if (invProduct!.getCategory.contains('Veg')) {
        foodImage = 'veg_icon.png';
      } else {
        foodImage = 'non_veg_icon.png';
      }
    }
    return Card(
      child: ListTile(
        key: ObjectKey(invProduct),
        leading: Image.network(
          invProduct!.getImage,
          width: MediaQuery.of(context).size.width * 0.21,
        ),
        title: productName(invProduct!),
        subtitle: Text('₹${invProduct!.getPrice}'),
        enableFeedback: true,
        dense: true,
        onTap: () async {
          await Provider.of<PcCtrl>(context, listen: false).getProductDetailsApi(
            context: context,
            productId: invProduct!.getId,
          );
          if (Provider.of<PcCtrl>(context, listen: false).product != null) {
            Navigator.pushNamed(context, ProductDetailsScreen.id);
          }
          /*Provider.of<ProductCatalogController>(context, listen: false)
              .productId = invProduct!.product;
          await Provider.of<ProductCatalogController>(context, listen: false)
              .getProductDetailsApi(
            context: context,
          );
          if (Provider.of<ProductCatalogController>(context, listen: false).product != null){
            Navigator.pushNamed(context, ProductDetailsScreen.id);
          }*/
        },
      ),
    );
  }
}
