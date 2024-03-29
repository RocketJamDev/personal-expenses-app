import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
                child: Text('${transaction.amount}\€')),
          ),
        ),
        title: Text('${transaction.title}'),
        subtitle:
            Text(DateFormat.yMMMd().format(transaction.date)),
        trailing: MediaQuery.of(context).size.width >= 500
            ? FlatButton.icon(
                label: const Text('Delete'),
                textColor: Colors.red,
                icon: const Icon(Icons.delete),
                onPressed: () => deleteTx(transaction.id),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                onPressed: () => deleteTx(transaction.id)),
      ),
    );
  }
}