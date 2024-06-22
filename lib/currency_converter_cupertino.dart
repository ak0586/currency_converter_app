import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyConverterCupertino extends StatefulWidget {
  const CurrencyConverterCupertino({super.key});

  @override
  State<CurrencyConverterCupertino> createState() =>
      _CurrencyConverterCupertinoState();
}

class _CurrencyConverterCupertinoState
    extends State<CurrencyConverterCupertino> {
  final TextEditingController textEditingController =
      TextEditingController(); // used to accept the user input fgrom the textField
  double result = 0;
  void convert() {
    if (textEditingController.text.isNotEmpty) {
      result = (double.parse(textEditingController.text) * 81);
      setState(() {
        //setState calls the build method of the stateful widget  function
        //we can also use result inside the setState
      });
    } else {
      setState(() {
        result = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey3,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey3,
        middle: Text('Currency Converter'),
      ),
      child: Center(
        child: Padding(
          // color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'INR ${(result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0))}',
                style: TextStyle(
                  fontSize: 30,
                  foreground: Paint()
                    ..strokeWidth = 4
                    ..color = Colors.purple
                    ..style = PaintingStyle.stroke,
                ),
              ),
              //const SizedBox(height: 10),
              CupertinoTextField(
                controller: textEditingController,
                //onSubmitted: (value) => result = double.parse(value),
                //scrollPadding: const EdgeInsets.all(20.0),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
                style: const TextStyle(
                  color: CupertinoColors.black,
                ),
                decoration: BoxDecoration(
                  // hintText: 'Please enter amount in USD',
                  color: CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                placeholder: 'Please enter amount in USD',
                prefix: const Icon(CupertinoIcons.money_dollar),
              ),
              const SizedBox(height: 10),
              CupertinoButton(
                onPressed: convert,
                //instead of ButtonStyle, we can use TextButton.styleFrom
                color: CupertinoColors.black,
                child: const Text(
                  'convert',
                  //style: TextStyle(color: CupertinoColors.activeBlue.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
