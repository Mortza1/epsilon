import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_state-manager.dart';

Map<String, String> imagesData = {
  "Autocode": 'assets/autocode.jpg',
  "Euclid's Elements": 'assets/euclids.jpg',
  "Sceptical Chymist": 'assets/chymist.jpg',
  "RoboSonic": 'assets/robosonic.jpg',
  "Voltaic": 'assets/voltaic.jpg',
  "Escherian Stairwell": 'assets/stairwell.jpg',
  "Area 51": 'assets/area51bg.jpg',
  "Cicada 3301": 'assets/cicada.jpg',
  "Cerebral Labyrinth": 'assets/cerebral.png',
  "Carson's Conundrum": 'assets/carson.png',
  "Phsycosphere" : 'assets/psycho.png'
};

class ModulesPortal extends StatefulWidget {
  const ModulesPortal({Key? key}) : super(key: key);

  @override
  State<ModulesPortal> createState() => _ModulesPortalState();
}

class _ModulesPortalState extends State<ModulesPortal> {
  late Future data;

  @override
  Widget build(BuildContext context) {
    final AppStateManager myProvider = Provider.of<AppStateManager>(context);
      setState(() {
        data = myProvider.teamData();
      });
    return FutureBuilder(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var hello = snapshot.data as Map<String, dynamic>;
          var modules = hello["modules"];
          print(modules.toString());
          return Scaffold(
            backgroundColor: Colors.grey.shade300,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Color(0xff361553),
                                size: 30,
                              )),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Text(
                            "Modules",
                            style: TextStyle(
                                color: Color(0xff361553),
                                fontSize: 30,
                                fontFamily: "Syne",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(50, 3, 0, 0),
                          child: Text(
                            "Selected Modules",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "Syne",
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    for (var i = 0; i < modules.length; i++)
                      ModuleBox(name: imagesData[modules[i]]!, text: modules[i])
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
                child: CircularProgressIndicator(
              color: Colors.purple,
            )),
          );
        }
      },
    );
  }
}

class ModuleBox extends StatelessWidget {
  final String name;
  final String text;

  const ModuleBox({Key? key, required this.name, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 170,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 75,
                          ),
                          Text(text, style: const TextStyle(color: Color(0xffaf52e0), fontFamily: "Syne", fontSize: 20, ),)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      image: DecorationImage(
                          image: AssetImage(name), fit: BoxFit.cover)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
