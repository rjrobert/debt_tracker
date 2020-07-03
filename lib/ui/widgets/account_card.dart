import 'package:debt_tracker/models/account.dart';
import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  final Account account;

  const AccountCard({Key key, this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(account.name),
              subtitle: Text(account.currentAmount.toString()),
            )
          ],
        ),
      );
}
