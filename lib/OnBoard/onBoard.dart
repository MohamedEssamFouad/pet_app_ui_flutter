import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pet_app_ui_flutter/OnBoard/FirstScreen.dart';
import 'package:pet_app_ui_flutter/OnBoard/SecondScreen.dart';
import 'package:pet_app_ui_flutter/OnBoard/ThirdScreen.dart';


class OnboardScreen extends HookWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final index = useState(0);
    final _controller = usePageController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  index.value = value;
                },
                controller: _controller,
                children: const [FirstScreen(), Secondscreen(), Thirdscreen()],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIndicator(active: index.value == 0),
                const SizedBox(width: 5),
                CustomIndicator(active: index.value == 1),
                const SizedBox(width: 5),
                CustomIndicator(active: index.value == 2),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Text(
                      index.value == 2 ? "Register" : "Skip",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (index.value == 2) {
                        // Handle register/login logic
                      } else {
                        _controller.animateToPage(
                          index.value + 1,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.linear,
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 199, 59),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        index.value == 2 ? "Login" : "Next",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomIndicator extends StatelessWidget {
  final bool active;
  const CustomIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: active ? const Color.fromARGB(255, 255, 199, 59) : Colors.grey,
      ),
      width: active ? 30 : 10,
      height: 10,
    );
  }
}
