import 'package:debt_tracker/ui/widgets/account_card.dart';
import 'package:debt_tracker/viewmodels/account_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AccountList extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<AccountListViewModel>.reactive(
        viewModelBuilder: () => AccountListViewModel(),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('Account List'),
          ),
          body: Expanded(
            child: model.data != null
                ? ListView.builder(
                    itemBuilder: (context, index) => AccountCard(
                      account: model.data[index],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                          Theme.of(context).primaryColor),
                    ),
                  ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: model.navigateToAddAccountView,
          ),
        ),
      );
}
