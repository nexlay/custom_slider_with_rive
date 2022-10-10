import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_custom_slider/const.dart';

class RiveSlider extends StatefulWidget {
  const RiveSlider({Key? key}) : super(key: key);

  @override
  State<RiveSlider> createState() => _RiveSliderState();
}

class _RiveSliderState extends State<RiveSlider> {
  SMITrigger? _sliderTrigger;
  String message = 'Wi-FI';

  void _onRiveInitSlider(Artboard artboard) async {
    final controller = StateMachineController.fromArtboard(
      artboard,
      'slider',
      onStateChange: _onStateChange,
    );
    artboard.addController(controller!);
    _sliderTrigger = controller.findSMI('switch') as SMITrigger;
  }

  void _onStateChange(
    String stateMachineName,
    String stateName,
  ) =>
      setState(
        () => message = stateName,
      );

  void _slide() => _sliderTrigger?.fire();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar, // AppBar
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Wrap(
              children: [
                Center(
                  child: Text(
                    '$message is on',
                    style:
                        const TextStyle(color: appBarTextColor, fontSize: 32.0),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: GestureDetector(
                    onTap: () {
                      //play animation
                      if (message == 'Wi-Fi') {
                        _onRiveInitSlider(
                            (_sliderTrigger?.controller.artboard)!);
                      }
                      _slide();
                    },
                    child: RiveAnimation.asset(
                      'assets/slider.riv',
                      onInit: _onRiveInitSlider,
                    ),
                  ),
                ),
                 info,//Text with info
              ],
            ),
          ),
        ),
      ),
    );
  }
}
