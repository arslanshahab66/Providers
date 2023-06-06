import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 2), (timer) {
      countProvider.Setcount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print('build');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Provider State Management"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<CountProvider>(builder: ((context, value, child) {
              print('only this builds');
              return Center(
                  child: Text(value.count.toString(),
                      style: const TextStyle(
                        fontSize: 30,
                      )));
            }))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            countProvider.Setcount();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
