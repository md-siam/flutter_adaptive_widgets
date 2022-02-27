import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAdaptiveWidgets extends StatefulWidget {
  const MyAdaptiveWidgets({Key? key}) : super(key: key);

  @override
  State<MyAdaptiveWidgets> createState() => _MyAdaptiveWidgetsState();
}

class _MyAdaptiveWidgetsState extends State<MyAdaptiveWidgets> {
  bool isSwitched = false;
  bool isSwitched2 = false;
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    // isIOS checker should be inside the build method
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return Scaffold(
      appBar: AppBar(
        title: isIOS ? const Text("iOS") : const Text("Android"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // -------------- Adaptive Button --------------
          Center(
            child: isIOS
                ? CupertinoButton.filled(
                    child: const Text('iOS Button'),
                    onPressed: showAdaptiveDialog,
                  )
                : ElevatedButton(
                    child: const Text('Android Button'),
                    onPressed: showAdaptiveDialog,
                  ),
          ),
          // -------------- Adaptive Switch --------------
          Switch.adaptive(
            value: isSwitched,
            onChanged: (newValue) {
              setState(() {
                isSwitched = newValue;
                print(isSwitched);
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          ),
          // ---------- Adaptive SwitchListTile ----------
          SwitchListTile.adaptive(
              title: const Text('SwitchListTile'),
              value: isSwitched2,
              onChanged: (newValue) {
                setState(() {
                  isSwitched2 = newValue;
                });
              }),
          // -------------- Adaptive Slider ---------------
          Slider.adaptive(
            value: _sliderValue,
            min: 0.0,
            max: 10.0,
            divisions: 10,
            label: _sliderValue.toString(),
            onChanged: (newValue) {
              setState(() {
                _sliderValue = newValue;
                print(_sliderValue);
              });
            },
          ),
          // -------- Adaptive CircularProgressIndicator ---------
          const CircularProgressIndicator.adaptive(),

          // ------------------ Adaptive IconButton -------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.adaptive.arrow_back, size: 30),
                onPressed: () {
                  print('Back');
                },
              ),
              IconButton(
                icon: Icon(Icons.adaptive.arrow_forward, size: 30),
                onPressed: () {
                  print('Forward');
                },
              ),
              IconButton(
                icon: Icon(Icons.adaptive.share, size: 30),
                onPressed: () {
                  print('Share');
                },
              ),
              IconButton(
                icon: Icon(Icons.adaptive.flip_camera, size: 30),
                onPressed: () {
                  print('Flip Camera');
                },
              ),
              IconButton(
                icon: Icon(Icons.adaptive.more, size: 30),
                onPressed: () {
                  print('More');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future showAdaptiveDialog() async {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    if (isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Title'),
          content: const Text('Body'),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Title'),
          content: const Text('Body'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }
}
