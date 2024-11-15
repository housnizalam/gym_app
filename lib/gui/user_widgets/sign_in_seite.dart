import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/navigator.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/gui/home_widgets/home.dart';
import 'package:gym_app/gui/user_widgets/sign_up_seite.dart';

class SignInWidget extends ConsumerWidget {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue[900]!, Colors.black]),
          ),
          child: AppBar(
            // iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text('Sign in',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
      body: MyContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autofocus: true,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.3),
              child: MyInkwell(
                height: 50,
                onTap: () {
                  context.animateToAsPushReplacement(
                      page: const HomeWidget(),
                      animationType: AnimationType.slideUp);
                  //ref.read(appStateProvider).addDay(Day(
                  //    date: DateTime.now(),
                  //    subTrainings: [benchPress]));
                },
                child: const FittedBox(
                    child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
            TextButton(
                onPressed: () {
                  context.animateToAsPush(
                      page: const SignUpWidget(),
                      animationType: AnimationType.slideUp);
                },
                child: const Text('I don\'t have an account',
                    style: TextStyle(color: Colors.white))),
            const SizedBox(),
            const SizedBox(),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
