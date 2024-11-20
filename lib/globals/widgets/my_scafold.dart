import 'package:flutter/material.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    super.key,
    this.onFloatingButton,
    this.onleftTitel,
    this.onRightTitel,
    this.floatingButton,
    this.leftTitel,
    this.rightTitel,
    this.lefBottomWidget,
    this.rightBottomWidget,
    this.appBar,
    this.drawer,
    required this.body,
  });
  final VoidCallback? onFloatingButton;
  final VoidCallback? onleftTitel;
  final VoidCallback? onRightTitel;
  final String? leftTitel;
  final String? rightTitel;
  final Widget body;
  final Widget? floatingButton;
  final Widget? lefBottomWidget;
  final Widget? rightBottomWidget;
  final PreferredSizeWidget? appBar;
  final Drawer? drawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      extendBody: true,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: floatingButton ??
          InkWell(
            onTap: () {
              if (onFloatingButton != null) {
                onFloatingButton!();
              }
            },
            child: Container(
              height: context.width * 0.15,
              width: context.width * 0.15,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
                gradient:
                    RadialGradient(colors: [Colors.blue[900]!, Colors.black]),
                borderRadius: BorderRadius.circular(context.width * 0.15),
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 0,
        color: Colors.black,
        height: context.height * 0.1,
        child: Row(
          children: [
            Expanded(
              child: lefBottomWidget ??
                  TextButton(
                    onPressed: () {
                      if (onleftTitel != null) {
                        onleftTitel!();
                      }
                    },
                    child: Text(
                      leftTitel ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.blue,
                            blurRadius: 1,
                            offset: Offset(-1.5, 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
            Container(
              width: 5,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.blue,
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ]),
            ),
            Expanded(
              child: rightBottomWidget ??
                  TextButton(
                    onPressed: () {
                      if (onRightTitel != null) {
                        onRightTitel!();
                      }
                    },
                    child: Text(
                      rightTitel ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.blue,
                            blurRadius: 1,
                            offset: Offset(1.5, 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
