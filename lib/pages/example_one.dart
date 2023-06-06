import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_provider/providers/example_one_provider.dart';
import 'package:provider/provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExampleOneProvider>(context, listen: false);
    print('build');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Example one provider'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ExampleOneProvider>(builder: ((context, value, child) {
              return Slider(
                  min: 0,
                  max: 1,
                  value: provider.value,
                  onChanged: ((val) {
                    provider.Setvalue(val);
                  }));
            })),
            Consumer<ExampleOneProvider>(builder: ((context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(provider.value),
                      ),
                      height: 100,
                      child: Center(child: Text('Container 1')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(provider.value),
                      ),
                      height: 100,
                      child: Center(child: Text('Container 2')),
                    ),
                  ),
                ],
              );
            })),
          ],
        ),
      ),
    );
  }
}
