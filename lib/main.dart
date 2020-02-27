import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions =[
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),

    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 29.99,
      date: DateTime.now(),
    ),
  ];

//  String titleInput;
//  String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
        Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Chart!'),
              elevation: 5,
            ),
          ),
        Card(
          elevation: 5,
          child:
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleController,
//                      onChanged:(val) {
//                        titleInput = val;
//                      } ,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountController,
//                      onChanged: (val) => amountInput = val,
                    ),
                    RaisedButton(
                      child: Text('Add Transaction'),
                      textColor: Colors.purple,
                      onPressed: (){
                        print(titleController.text);
                      },
                    )
                  ],
                ),
              ),
        ),

        Column(children: transactions.map((tx) {
          return Card(
            child: Row(children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15) ,
                decoration: BoxDecoration(border: Border.all(color: Colors.purple, width: 2),),
                padding: EdgeInsets.all(10),
                child:
                  Text(
                    '\$${tx.amount}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
               ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Text(
                    tx.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                ),
                Text(
                    DateFormat.yMMMd().format(tx.date),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                ),
              ],),
              ],
            ),
          );
        }).toList(),),
        ],
      ),
    );
  }
}