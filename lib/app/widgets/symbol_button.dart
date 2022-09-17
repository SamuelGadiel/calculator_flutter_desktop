import 'package:flutter/material.dart';

import '../infrastrucuture/bloc/calculator_events.dart';
import '../pages/home_page.dart';

class SymbolButton extends StatelessWidget {
  final String symbol;
  final bool isOperation;

  const SymbolButton({
    required this.symbol,
    this.isOperation = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => calculatorBloc.add(HandleCalculatorEvent(symbol)),
      child: Container(
        color: isOperation ? const Color(0XFF0e244a) : const Color(0xFF111111),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 5,
        height: (MediaQuery.of(context).size.height * 0.6) / 4,
        child: symbol == 'backspace' ? const Icon(Icons.backspace, size: 44) : Text(symbol),
      ),
    );
  }
}
