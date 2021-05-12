import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  Widget buildTransaction(BuildContext context, int index) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Container(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\$${transactions[index].amount.toString()}',
              ),
            ),
          ),
        ),
        title: Text(
          transactions[index].title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          DateFormat.yMMMEd().format(transactions[index].date),
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => deleteTransaction(transactions[index].id),
          color: Theme.of(context).errorColor,
        ),
      ),
    );
  }

  Widget transactionList(BuildContext context) {
    if (transactions.length <= 0) {
      return Column(
        children: [
          Container(
            height: 300,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'No item to display',
            style: Theme.of(context).textTheme.title,
          ),
        ],
      );
    } else {
      return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: buildTransaction,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return transactionList(context);
  }
}
