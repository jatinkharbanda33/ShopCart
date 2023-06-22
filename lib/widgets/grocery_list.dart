import 'package:flutter/material.dart';

import './new_item.dart';

import '../models/grocery_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

var _finallist = [];

class _GroceryListState extends State<GroceryList> {
  @override
  void addnew() async {
    final _newitem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: ((context) => const NewItem())));
    if (_newitem != null) {
      setState(() {
        _finallist.add(_newitem);
      });
    }
  }

  void _removeitem(GroceryItem m) {
    _finallist.remove(m);
    
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Groceries"),
        actions: [
          IconButton(
              onPressed: () {
                return addnew();
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: _finallist.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                Center(
                  child: Text(
                    'Nothing here',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: _finallist.length,
              itemBuilder: (ctx, index) => Dismissible(
                key: ValueKey(_finallist[index].id),
                onDismissed: (direction) => _removeitem,
                child: ListTile(
                  title: Text(_finallist[index].name),
                  leading: Container(
                    height: 24,
                    width: 24,
                    color: _finallist[index].category.itscolor,
                  ),
                  trailing: Text(_finallist[index].quantity.toString()),
                ),
              ),
            ),
    );
  }
}
