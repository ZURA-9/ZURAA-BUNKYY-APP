import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewBunk extends StatefulWidget {
  final Function addBunk;
  final String sub;
  NewBunk(this.addBunk, this.sub);
  @override
  _NewBunkState createState() => _NewBunkState();
}

class _NewBunkState extends State<NewBunk> {
  final reasonController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (reasonController.text.isEmpty) {
      return;
    }
    final enteredReason = reasonController.text;
    widget.addBunk(widget.sub, enteredReason, _selectedDate);
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Reason'),
                controller: reasonController,
                onSubmitted: (_) => _submitData(),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Chosen'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
                  ),
                  FlatButton(
                      textColor: Colors.purple,
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  RaisedButton(
                      child: Text('Post Bunk'),
                      color: Colors.purple,
                      textColor: Colors.white,
                      onPressed: () {
                        _submitData();
                        Navigator.of(context).pop();
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
