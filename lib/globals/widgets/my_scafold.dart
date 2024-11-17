import 'package:flutter/material.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    super.key,
    this.onFloatingButton,
    this.onleftTitel,
    this.onRightTitel,
    required this.leftTitel,
    required this.rightTitel,
    required this.body,
  });
  final VoidCallback? onFloatingButton;
  final VoidCallback? onleftTitel;
  final VoidCallback? onRightTitel;
  final String leftTitel;
  final String rightTitel;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: InkWell(
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
            gradient: RadialGradient(colors: [Colors.blue[900]!, Colors.black]),
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
              child: TextButton(
                onPressed: () {
                  if (onleftTitel != null) {
                    onleftTitel!();
                  }
                },
                child: Text(
                  leftTitel,
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
              child: TextButton(
                onPressed: () {
                  if (onRightTitel != null) {
                    onRightTitel!();
                  }
                },
                child: Text(
                  rightTitel,
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
