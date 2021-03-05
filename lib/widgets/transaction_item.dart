import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: FittedBox(child: Text('\$ ${transaction.amount}')),
        ),
      ),
      title: Text(
        transaction.title,
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Text(
        DateFormat.yMMMd().format(transaction.date),
      ),
      trailing: MediaQuery.of(context).size.width > 360
          ? TextButton.icon(
              style:
                  TextButton.styleFrom(primary: Theme.of(context).errorColor),
              onPressed: () => deleteTransaction(transaction.id),
              icon: Icon(Icons.delete),
              label: Text('delete'))
          : IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () => deleteTransaction(transaction.id),
            ),
    );
  }
}
