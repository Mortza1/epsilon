import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:provider/provider.dart';

import '../models/app_state-manager.dart';

class ModuleSelector extends StatefulWidget {
  const ModuleSelector({Key? key}) : super(key: key);

  @override
  State<ModuleSelector> createState() => _ModuleSelectorState();
}

class _ModuleSelectorState extends State<ModuleSelector> {
  List selectedModules = [];

  @override
  Widget build(BuildContext context) {
    final AppStateManager myProvider = Provider.of<AppStateManager>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Container(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text(
              "Modules",
              style: TextStyle(
                  color: Color(0xff361553),
                  fontSize: 30,
                  fontFamily: 'Syne',
                  fontWeight: FontWeight.bold),
            ),
            const Center(
              child: Text(
                "* select 4 to 6 of these modules",
                style: TextStyle(
                    color: Color(0xffaf52e0),
                    fontSize: 15,
                    fontFamily: 'Syne',
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1050,
                  width: 250,
                  child: CustomCheckBoxGroup(
                    unSelectedBorderColor: const Color(0xff000000),
                    selectedBorderColor: const Color(0xff361553),
                    enableShape: true,
                    shapeRadius: 10,
                    radius: 10,
                    scrollController: ScrollController(),
                    height: 80,
                    buttonTextStyle: const ButtonTextStyle(
                      selectedColor: Colors.white,
                      unSelectedColor: Color(0xff361553),
                      textStyle: TextStyle(fontSize: 20, fontFamily: "Syne", fontWeight: FontWeight.bold),
                    ),
                    unSelectedColor: const Color(0xffffffff),
                    buttonLables: const [
                      "Autocode",
                      "Euclid's Elements",
                      "Carson's Conondrum",
                      "Sceptical chymist",
                      "Robosonic",
                      "The Voltaic",
                      "Phsycosphere",
                      "Cicada 3301",
                      "Escherian Stairwell",
                      "Cerebrial Labyrinth",
                      "Area 51"
                    ],
                    buttonValuesList: const [
                      7,
                      5,
                      9,
                      6,
                      8,
                      10,
                      11,
                      2,
                      4,
                      3,
                      1,
                    ],
                    checkBoxButtonValues: (values) {
                      print(values);
                      if (values.length > 6) {
                        values.removeLast();
                        myProvider.setstemModules(values.sublist(0, 6));
                      }
                      if (values.length < 7) {
                        myProvider.setstemModules(values);
                      }
                    },
                    spacing: 0,
                    defaultSelected: myProvider.stemmodules,
                    horizontal: true,
                    enableButtonWrap: true,
                    width: 100,
                    absoluteZeroSpacing: false,
                    selectedColor: const Color(0xff361553),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 19,)
      ])),
    );
  }
}
class Modules extends StatefulWidget {
  const Modules({Key? key}) : super(key: key);

  @override
  State<Modules> createState() => _ModulesState();
}

class _ModulesState extends State<Modules> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ModuleSelector(),
      ],
    );
  }
}

