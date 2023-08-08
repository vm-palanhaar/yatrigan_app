import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:yatrigan/src/controller/main/ir/ir_ctrl.dart';
import 'package:yatrigan/src/model/main/ir/helpline/ir_helpline_grp_mdl.dart';
import 'package:yatrigan/src/view/widgets/error/loading_widget.dart';

class IrHelplinesGrpWidget extends StatefulWidget {
  const IrHelplinesGrpWidget({Key? key}) : super(key: key);

  @override
  State<IrHelplinesGrpWidget> createState() => _IrHelplinesGrpWidgetState();
}

class _IrHelplinesGrpWidgetState extends State<IrHelplinesGrpWidget> {
  @override
  void initState() {
    getHelplinesGrpApi();
    super.initState();
  }

  Future<void> getHelplinesGrpApi() async {
    if (Provider.of<IrCtrl>(context, listen: false).irHelplinesGrp.isEmpty) {
      await Provider.of<IrCtrl>(context, listen: false).getHelplinesGrpApi(
        context: context,
      );
    }
  }

  Widget body() {
    return Consumer<IrCtrl>(
      builder: (context, controller, _) {
        if (controller.irHelplinesGrp.isNotEmpty) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text('State Helplines',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),),
                floating: false,
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    IrHelplineGrpMdl helpline =
                    controller.irHelplinesGrp.elementAt(index);
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            helpline.state,
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
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.call,
                                    color: Colors.blue,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: controller.irHelplinesGrp.length,
                ),
              ),
            ],
          );
        } else {
          return  Container();
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
