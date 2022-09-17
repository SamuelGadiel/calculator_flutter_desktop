abstract class CalculatorEvents {}

class HandleCalculatorEvent implements CalculatorEvents {
  final String symbol;

  HandleCalculatorEvent(this.symbol);
}
