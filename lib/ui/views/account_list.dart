import 'package:debt_tracker/ui/widgets/account_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:debt_tracker/ui/widgets/loading_list.dart';
import 'package:debt_tracker/viewmodels/account_list_view_model.dart';

class AccountList extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<AccountListViewModel>.reactive(
        viewModelBuilder: () => AccountListViewModel(),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('Account List'),
          ),
          body: Center(
            child: model.isBusy
                ? LoadingList()
                : ListView.builder(
                    itemCount: model.data.length,
                    itemBuilder: (context, index) => AccountCard(
                      account: model.data[index],
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
