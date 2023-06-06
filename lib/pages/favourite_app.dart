import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_provider/providers/fav_item_provder.dart';
import 'package:provider/provider.dart';

import 'myfav.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyFavouriteScreen()));
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
                itemCount: 10,
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
