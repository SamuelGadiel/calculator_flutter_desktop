import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../infrastrucuture/bloc/calculator_bloc.dart';
import '../infrastrucuture/bloc/calculator_states.dart';
import '../widgets/symbol_button.dart';

final calculatorBloc = CalculatorBloc();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event) {
        if (event is RawKeyUpEvent) {
          print(event.logicalKey.keyLabel);
          if (event.isKeyPressed(LogicalKeyboardKey.enter)) {}
        }
      },
      child: Scaffold(
        body: DefaultTextStyle(
          style: GoogleFonts.roboto(fontSize: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                color: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: BlocBuilder<CalculatorBloc, CalculatorStates>(
                  bloc: calculatorBloc,
                  builder: (context, state) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        calculatorBloc.controller.text,
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Column(
                    children: const [
                      SymbolButton(symbol: '7'),
                      SymbolButton(symbol: '4'),
                      SymbolButton(symbol: '1'),
                      SymbolButton(symbol: '.'),
                    ],
                  ),
                  Column(
                    children: const [
                      SymbolButton(symbol: '8'),
                      SymbolButton(symbol: '5'),
                      SymbolButton(symbol: '2'),
                      SymbolButton(symbol: '0'),
                    ],
                  ),
                  Column(
                    children: const [
                      SymbolButton(symbol: '9'),
                      SymbolButton(symbol: '6'),
                      SymbolButton(symbol: '3'),
                      SymbolButton(symbol: '='),
                    ],
                  ),
                  Column(
                    children: const [
                      SymbolButton(isOperation: true, symbol: '/'),
                      SymbolButton(isOperation: true, symbol: 'x'),
                      SymbolButton(isOperation: true, symbol: '-'),
                      SymbolButton(isOperation: true, symbol: '+'),
                    ],
                  ),
                  Column(
                    children: const [
                      SymbolButton(symbol: 'backspace'),
                      SymbolButton(symbol: 'C'),
                      SymbolButton(symbol: '^'),
                      SymbolButton(symbol: '\u221a'),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
