import 'package:debt_tracker/models/account.dart';
import 'package:debt_tracker/ui/widgets/account_form.dart';
import 'package:debt_tracker/viewmodels/add_account_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddAccountView extends StatelessWidget {
  final Account editingAccount;

  const AddAccountView({Key key, this.editingAccount}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<AddAccountViewModel>.nonReactive(
        viewModelBuilder: () => AddAccountViewModel(),
        onModelReady: (model) => model.setEditingAccount(editingAccount),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: model.editing ? Text('Edit Account') : Text('New Account'),
          ),
          body: AccountForm(
            initialValue: model.editing ? editingAccount.toJson() : {},
            onSubmit: (data) => model.addAccount(data),
            onCancel: () => model.cancel(),
          ),
        ),
      );
}
