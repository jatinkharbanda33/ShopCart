import 'package:flutter/material.dart';
import '../data/dummy_items.dart';
import './new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

void addnew(BuildContext ctx) {
  Navigator.of(ctx)
      .push(MaterialPageRoute(builder: ((context) => const NewItem())));
}

class _GroceryListState extends State<GroceryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Groceries"),
        actions: [
          IconButton(
              onPressed: () {
                return addnew(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(groceryItems[index].name),
          leading: Container(
            height: 24,
            width: 24,
            color: groceryItems[index].category.itscolor,
          ),
          trailing: Text(groceryItems[index].quantity.toString()),
        ),
      ),
    );
  }
}
