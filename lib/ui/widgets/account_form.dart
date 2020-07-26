import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AccountForm extends StatefulWidget {
  final Map<String, dynamic> initialValue;
  final Function(Map<String, dynamic>) onSubmit;
  final Function onCancel;

  const AccountForm({
    Key key,
    this.initialValue,
    this.onSubmit,
    this.onCancel,
  }) : super(key: key);

  @override
  _AccountFormState createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          FormBuilder(
            key: _fbKey,
            initialValue: widget.initialValue,
            child: Column(
              children: <Widget>[
                FormBuilderTextField(
                  attribute: 'name',
                  decoration: InputDecoration(labelText: 'Name'),
                  validators: [FormBuilderValidators.required()],
                ),
                FormBuilderTextField(
                  attribute: 'originalAmount',
                  decoration: InputDecoration(labelText: 'Original Amount'),
                  validators: [
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.min(0),
                  ],
                ),
                FormBuilderTextField(
                  attribute: 'interest',
                  decoration: InputDecoration(labelText: 'Interest Rate'),
                  validators: [
                    FormBuilderValidators.required(),
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.min(0),
                  ],
                ),
                FormBuilderDateTimePicker(
                  attribute: 'dueDate',
                  decoration: InputDecoration(labelText: 'Due Date'),
                  inputType: InputType.date,
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              MaterialButton(
                child: Text('Save'),
                onPressed: () {
                  if (_fbKey.currentState.saveAndValidate())
                    widget.onSubmit(_fbKey.currentState.value);
                },
              ),
              MaterialButton(
                child: Text('Cancel'),
                onPressed: () {
                  _fbKey.currentState.reset();
                  widget.onCancel();
                },
              ),
            ],
          ),
        ],
      );
}
