import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

// import 'package:flutter/widgets.dart';

void main() {
  runApp(const CurrencyConverterMaterialApp());
}

class CurrencyConverterMaterialApp extends StatefulWidget {
  const CurrencyConverterMaterialApp({super.key});

  @override
  State<CurrencyConverterMaterialApp> createState() =>
      _CurrencyConverterMaterialAppState();
}

class _CurrencyConverterMaterialAppState
    extends State<CurrencyConverterMaterialApp> {
  final TextEditingController textEditingController =
      TextEditingController(); // used to accept the user input fgrom the textField
  double result = 0.0;
  void convert() {
    if (textEditingController.text.isNotEmpty) {
      result = (double.parse(textEditingController.text) * 81);
      setState(() {
        //setState calls the build method of the stateful widget  function
        //we can also use result inside the setState
      });
      // @override
      // void initState() {
      //   super.initState();
      // }

      // @override
      // void dispose() {
      //   textEditingController.dispose();
      //   result = 0;
      //   super.dispose();
      // }
    } else {
      setState(() {
        result = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        //automaticallyImplyLeading: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        title: const Text('Currency Converter',
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.blueGrey,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/SL-020622-4930-40.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            // color: Colors.white,
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'INR ${(result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0))}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10),
                TextField(
                    controller: textEditingController,
                    //onSubmitted: (value) => result = double.parse(value),
                    scrollPadding: const EdgeInsets.all(20.0),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                      signed: false,
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.monetization_on_outlined),
                      prefixIconColor: Colors.purple,
                      hintText: 'Please enter amount in USD',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 5,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 5,
                        ),
                      ),
                    )),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: convert,
                  //instead of ButtonStyle, we can use TextButton.styleFrom
                  style: ButtonStyle(
                    // minimumSize: MaterialStatePropertyAll(),
                    backgroundColor: MaterialStateProperty.all(Colors.black87),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    minimumSize: const MaterialStatePropertyAll(
                      Size(double.infinity, 50),
                    ),
                    shape: MaterialStateProperty.all(
                      const StadiumBorder(
                        side: BorderSide(
                            style: BorderStyle.solid,
                            width: 5,
                            color: Colors.blue),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Click here',
                    //style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 
/*
child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "0",
              style: TextStyle(
                foreground: Paint()
                  ..color = Colors.red
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 5,
                fontStyle: FontStyle.italic,
                fontSize: 50,
              ),
            ),
          ]), */