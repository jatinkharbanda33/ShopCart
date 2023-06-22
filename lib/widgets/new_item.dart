import 'package:flutter/material.dart';
import '../data/categories.dart';
import '../models/category.dart';
import '../models/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _finalkey = GlobalKey<FormState>();
  var _enteredname = '';
  var _enteredquantity = 0;
  var _selectedcategory = categories[Categories.vegetables]!;
  void _saveitem() {
    if (_finalkey.currentState!.validate()) {
      _finalkey.currentState!.save();
      Navigator.of(context).pop(
        GroceryItem(id: DateTime.now().toString(), name: _enteredname, quantity: _enteredquantity, category: _selectedcategory)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Item"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _finalkey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: InputDecoration(
                    label: Text('Name'),
                  ),
                  validator: (val) {
                    if (val == null ||
                        val.isEmpty ||
                        val.trim().length <= 1 ||
                        val.trim().length > 50) {
                      return 'Must be between 1 and 50 characters!';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _enteredname = newValue!;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        maxLength: 10,
                        initialValue: '1',
                        decoration: InputDecoration(
                          label: Text('Quantity'),
                        ),
                        validator: (val) {
                          if (val == null ||
                              val.isEmpty ||
                              int.parse(val) == null ||
                              int.parse(val) <= 0 ||
                              int.parse(val) >= 11) {
                            return 'Must be between 1 and 10';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _enteredquantity = int.parse(val!);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: DropdownButton(
                          value: _selectedcategory,
                          items: [
                            for (final Category in categories.entries)
                              DropdownMenuItem(
                                  value: Category.value,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 16,
                                        width: 16,
                                        color: Category.value.itscolor,
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(Category.value.title),
                                    ],
                                  ))
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedcategory = value!;
                            });
                          }),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          _finalkey.currentState!.reset();
                        },
                        child: const Text("Reset")),
                    ElevatedButton(onPressed: _saveitem, child: Text('submit')),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
