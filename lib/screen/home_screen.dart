import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(onHeartPressed: onHeartPressed, firstDay: firstDay),
            _CoupleImage()
          ],
        ),
      ),
    );
  }

  void onHeartPressed() {
    // print("pressed");
    // setState(() {
    //   firstDay = firstDay.subtract(
    //     const Duration(days: 1),
    //   );
    // });
    showCupertinoDialog(
        context: context,
        builder: ((context) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              color: Colors.white,
              child: CupertinoDatePicker(
                initialDateTime: firstDay.subtract(
                  const Duration(days: 1),
                ),
                maximumDate: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day),
                onDateTimeChanged: (DateTime date) {
                  setState(() {
                    firstDay = date;
                  });
                },
                mode: CupertinoDatePickerMode.date,
              ),
            ),
          );
        }),
        barrierDismissible: true);
  }
}

class _DDay extends StatelessWidget {
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;
  const _DDay({required this.onHeartPressed, required this.firstDay});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          "U&I",
          style: textTheme.headline1,
        ),
        const SizedBox(
          height: 16,
        ),
        Column(
          children: [
            Text(
              "우리 처음 만난 날",
              style: textTheme.bodyText1,
            ),
            Text(
              "${firstDay.year}.${firstDay.month}.${firstDay.day}",
              style: textTheme.bodyText2,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        IconButton(
            onPressed: onHeartPressed,
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 50,
            )),
        const SizedBox(
          height: 16,
        ),
        Text(
          "D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}",
          style: textTheme.headline2,
        ),
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        "asset/img/middle_image.png",
        height: MediaQuery.of(context).size.height / 2,
      ),
    );
  }
}
