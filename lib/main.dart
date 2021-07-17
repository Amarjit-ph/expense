import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Nike Shoes',
      amount: 120,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 100,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Electric Bill',
      amount: 500.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Internet Bill',
      amount: 500.00,
      date: DateTime.now(),
    ),
  ];

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return SingleChildScrollView(
            child: Container(
                height: 220,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: NewTransaction(_addNewTransaction)),
          );
        });
  }

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: Text('Expense Management'));
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => {_startAddNewTransaction(context)},
          child: Icon(Icons.add),
        ),
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: (MediaQuery.of(context).size.height -
                        (appBar.preferredSize.height +
                            MediaQuery.of(context).padding.top)) *
                    0.3,
                width: double.infinity,
                child: Card(
                  elevation: 2,
                  child: Image.asset(
                    'assets/images/banner.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                  height: (MediaQuery.of(context).size.height -
                          (appBar.preferredSize.height +
                              MediaQuery.of(context).padding.top)) *
                      0.7,
                  child: TransactionList(_userTransactions, _deleteTransaction))
            ],
          ),
        ));
  }
}
