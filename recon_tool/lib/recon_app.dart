import 'package:flutter/material.dart';
import 'package:recon_tool/app/recon_content.dart';

class ReconApp extends StatelessWidget {
  const ReconApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.lightGreen,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.lightGreen,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Network Recon Tool"),
          // elevation: 0.0,
          centerTitle: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(6),
            ),
          ),
        ),
        body: const ReconStructure(),
      ),
    );
  }
}

class ReconStructure extends StatelessWidget {
  const ReconStructure({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        children: [
          Card(
            // color: Colors.white24,
            child: EcomuMenu(
              menuItems: [
                EcomuMenuItem(
                  name: "Network Hosts",
                  iconData: Icons.home,
                ),
              ],
            ),
          ),
          const Expanded(
            child: Card(
              //  color: Colors.white30,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ReconContent(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EcomuMenu extends StatefulWidget {
  /// List of the menu Items [EcomuMenuItem] to be displayed
  final List<EcomuMenuItem> menuItems;
  const EcomuMenu({
    Key? key,
    required this.menuItems,
  }) : super(key: key);

  @override
  State<EcomuMenu> createState() => _EcomuMenuState();
}

class _EcomuMenuState extends State<EcomuMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            width: 225.0,
            child: ListView.builder(
              controller: ScrollController(),
              itemCount: widget.menuItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListTile(
                    leading: Icon(widget.menuItems[index].iconData),
                    title: Text(widget.menuItems[index].name),
                    //onTap: () {},
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class EcomuMenuItem {
  /// Menu item displayed name
  String name;

  /// Menu item icon
  IconData iconData;

  /// Constructs [Menu]
  EcomuMenuItem({
    required this.name,
    required this.iconData,
  });
}
