import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: const Center(
          child: DemoSlider(),
        ),
      ),
    );
  }
}

class DemoSlider extends StatefulWidget {
  const DemoSlider({super.key});

  @override
  State<DemoSlider> createState() => _DemoSliderState();
}

class _DemoSliderState extends State<DemoSlider> {
  double _sliderValue = 20;
  double _sliderValueSubmit = 20;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            value: _sliderValue,
            min: 0,
            max: 100,
            divisions: 10,
            label: _sliderValue.round().toString(),
            onChanged: (newValue) {
              setState(() {
                _sliderValue = newValue;
              });
            },
          ),
          Text('Slider value: $_sliderValue'),
          ElevatedButton(onPressed: () {
            setState(() {
              _sliderValueSubmit = _sliderValue;
            });
          }, child: const Text('Submit')),
          Text('Slider value submit: $_sliderValueSubmit'),
        ],
      ),
    );
  }
}
