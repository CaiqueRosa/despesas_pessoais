import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  String? title;

  double? value;

  _submitForm() {
    title = titleController.text;
    value = double.tryParse(valueController.text) ?? 0.0;
    if (title!.isEmpty || value! <= 0) {
      return;
    }
    widget.onSubmit(title!, value!);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              // onChanged: (value) => title = value,
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Título'),
              onSubmitted: (_) => _submitForm(),
            ),
            TextField(
              // onChanged: (valueCash) => value = valueCash,
              controller: valueController,
              decoration: const InputDecoration(labelText: 'Valor (R\$)'),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
            ),
            TextButton(
              onPressed: _submitForm,
              child: const Text(
                'Nova Transação',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
