import 'package:flutter/material.dart';
import '../data/categories.dart';
import '../models/category.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Item"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: InputDecoration(
                    label: Text('Name'),
                  ),
                  validator: (val) {
                    return 'abd';
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
                      ),
                    ),
                    const SizedBox(width: 6,),
                    Expanded(
                      child: DropdownButton(items: [
                        for(final Category in categories.entries)
                        DropdownMenuItem(
                          value: Category.value,
                          child: Row(
                          children: [
                            Container(
                              height: 16,
                              width: 16,
                              color: Category.value.itscolor,
                            ),
                            const SizedBox(width: 6,),
                            Text(Category.value.title),
                          ],
                        ))
                      ], onChanged:(value){
                    
                      }),
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){}, child:const Text("Reset")),
                    ElevatedButton(onPressed: (){}, child: Text('submit')),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
