import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/productcatalog/product_catalog_ctrl.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);
  static String id = 'ProductDetailsScreen';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int trackImage = 0;

  IconButton _leftButton() {
    return IconButton(
      onPressed: () {
        if (trackImage == 0) {
          trackImage =
              Provider.of<PcCtrl>(context, listen: false).productImage.length -
                  1;
        } else {
          trackImage--;
        }
        setState(() {});
      },
      icon: const Icon(Icons.arrow_left),
    );
  }

  IconButton _rightButton() {
    return IconButton(
      onPressed: () {
        if (trackImage ==
            Provider.of<PcCtrl>(context, listen: false).productImage.length -
                1) {
          trackImage = 0;
        } else {
          trackImage++;
        }
        setState(() {});
      },
      icon: const Icon(Icons.arrow_right),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${Provider.of<PcCtrl>(context, listen: false).product!.getBrand} '
            '${Provider.of<PcCtrl>(context, listen: false).product!.getName}'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01,
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _leftButton(),
                Container(
                  height: MediaQuery.of(context).size.height * 0.27,
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.08,
                    vertical: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: Image.network(
                    Provider.of<PcCtrl>(context, listen: false)
                        .productImage
                        .elementAt(trackImage),
                  ),
                ),
                _rightButton(),
              ],
            ),
            if (Provider.of<PcCtrl>(context, listen: false)
                .product!
                .getBrand
                .isNotEmpty)
              ListTile(
                title: const Text('Brand'),
                trailing: Text(Provider.of<PcCtrl>(context, listen: false)
                    .product!
                    .getBrand),
              ),
            ListTile(
              title: const Text('Product'),
              trailing: Text(
                  Provider.of<PcCtrl>(context, listen: false).product!.getName),
            ),
            ListTile(
              title: const Text('Category'),
              trailing: Text(
                  Provider.of<PcCtrl>(context, listen: false).product!.getCat),
            ),
            ListTile(
              title: const Text('Price'),
              trailing: Text(
                  '₹${Provider.of<PcCtrl>(context, listen: false).product!.getPrice}'),
            ),
            ListTile(
              title: const Text('Description'),
              subtitle: Text(
                Provider.of<PcCtrl>(context, listen: false).product!.getDesc,
                textDirection: TextDirection.ltr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
