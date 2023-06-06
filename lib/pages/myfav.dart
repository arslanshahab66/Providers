import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../providers/fav_item_provder.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({super.key});

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteprovider = Provider.of<FavouriteItemprovider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite screen'),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyFavouriteScreen()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteprovider.selecteditem.length,
                itemBuilder: ((context, index) {
                  return Consumer<FavouriteItemprovider>(
                      builder: ((context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selecteditem.contains(index)) {
                          value.removeitem(index);
                        } else {
                          value.additem(index);
                        }
                      },
                      title: Text('Item ' + index.toString()),
                      trailing: Icon(value.selecteditem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                    );
                  }));
                })),
          )
        ],
      ),
    );
  }
}
