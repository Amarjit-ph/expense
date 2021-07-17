import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function newTranscation;
  NewTransaction(this.newTranscation);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Title'),
          controller: titleController,
          keyboardType: TextInputType.text,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Amount'),
          controller: amountController,
          keyboardType: TextInputType.number,
        ),
        FlatButton(
          onPressed: () => {
            widget.newTranscation(
              titleController.text,
              double.parse(amountController.text),
            ),
            Navigator.of(context).pop()
          },
          child: Text("Add Transaction", style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
