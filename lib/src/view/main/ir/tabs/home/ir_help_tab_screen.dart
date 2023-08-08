import 'package:flutter/material.dart';
import 'package:yatrigan/src/view/main/ir/widgets/home/ir_helplines_grp_widget.dart';
import 'package:yatrigan/src/view/main/ir/widgets/home/ir_helplines_widget.dart';

class IrHelpTabScreen extends StatelessWidget {
  const IrHelpTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: Column(
          children: const [
            IrHelplinesWidget(),
            IrHelplinesGrpWidget(),
          ],
        ),
      ),
    );
  }
}
