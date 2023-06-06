import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/home_page_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: ChangeNotifierProvider<HomePageProvider>(
          create: (context) => HomePageProvider(),
          child: Consumer<HomePageProvider>(
              builder: (context, provider, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider.eligibiltymessage.toString(),
                        style: TextStyle(
                          color: (provider.isEligible == true)
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Enter your age',
                        ),
                        onChanged: (value) {
                          provider.checkEligibilty(int.parse(value));
                        },
                      ),
                    ],
                  )),
        ),
      )),
    ));
  }
}
