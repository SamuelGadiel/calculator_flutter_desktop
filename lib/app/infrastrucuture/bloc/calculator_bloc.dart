import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../calculator.dart';
import 'calculator_events.dart';
import 'calculator_states.dart';

class CalculatorBloc extends Bloc<CalculatorEvents, CalculatorStates> {
  CalculatorBloc() : super(CalculatorInitialState()) {
    on<HandleCalculatorEvent>(_handleOperation);
  }

  final TextEditingController controller = TextEditingController();

  String operation = '';

  void _handleOperation(HandleCalculatorEvent event, Emitter<CalculatorStates> emit) {
    emit(CalculatorLoadingState());

    switch (event.symbol) {
      case 'backspace':
        if (controller.text.isNotEmpty) {
          if (controller.text.endsWith(operation)) {
            operation = '';
          }
          controller.text = controller.text.substring(0, controller.text.length - 1);
        }

        break;
      case 'C':
        controller.clear();
        operation = '';
        break;
      case '.':
        if (!controller.text.contains('.') && (operation.isEmpty || !controller.text.endsWith(operation))) {
          controller.text = '${controller.text}${event.symbol}';
        }
        break;

      case '=':
        if (operation.isEmpty) break;

        final int operationIndex = controller.text.indexOf(operation);

        final num first = num.parse(controller.text.substring(0, operationIndex));

        final num second = num.parse(controller.text.substring(operationIndex + 1));

        switch (operation) {
          case '+':
            controller.text = Calculator.add(first, second).toString();
            break;
          case '-':
            controller.text = Calculator.sub(first, second).toString();
            break;
          case 'x':
            controller.text = Calculator.mult(first, second).toString();
            break;
          case '/':
            controller.text = Calculator.div(first, second).toString();
            break;
          case '^':
            controller.text = Calculator.exp(first, second).toString();
            break;
        }
        operation = '';

        break;

      default:
        if (num.tryParse(event.symbol) != null) {
          controller.text = '${controller.text}${event.symbol}';
        } else if (['/', 'x', '-', '+', '^'].contains(event.symbol) && operation.isEmpty && !controller.text.endsWith('.')) {
          operation = event.symbol;
          controller.text = '${controller.text}${event.symbol}';
        }
    }

    emit(CalculatorSuccessState());
  }
}
