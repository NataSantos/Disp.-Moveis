import 'dart:io';

double calcular(double num1, double num2, String operacao) {
  if (operacao == '+') {
    return num1 + num2;
  } else if (operacao == '-') {
    return num1 - num2;
  } else if (operacao == '*') {
    return num1 * num2;
  } else if (operacao == '/') {
    if (num2 == 0) throw Exception('Divisão por zero!');
    return num1 / num2;
  } else {
    throw Exception('Operação inválida!');
  }
}

void main() {
  List<String> historico = [];

  while (true) {
    print('\nCalculadora Simples');

    double? num1;
    while (num1 == null) {
      print('Digite o primeiro número:');
      var input1 = stdin.readLineSync();
      try {
        num1 = double.parse(input1!);
      } catch (e) {
        print('Entrada inválida! Digite um número válido.');
      }
    }

    String? operacao;
    while (operacao == null) {
      print('Digite a operação (+, -, *, /):');
      var inputOp = stdin.readLineSync();
      if (inputOp == '+' ||
          inputOp == '-' ||
          inputOp == '*' ||
          inputOp == '/') {
        operacao = inputOp;
      } else {
        print('Operação inválida! Digite novamente.');
      }
    }

    double? num2;
    while (num2 == null) {
      print('Digite o segundo número:');
      var input2 = stdin.readLineSync();
      try {
        num2 = double.parse(input2!);
      } catch (e) {
        print('Entrada inválida! Digite um número válido.');
      }
    }

    try {
      double resultado = calcular(num1, num2, operacao);
      print('Resultado: $resultado');
      historico.add('$num1 $operacao $num2 = $resultado');
    } catch (e) {
      print('Erro: $e');
    }

    print('Deseja continuar? (s/n)');
    var continuar = stdin.readLineSync();
    if (continuar != 's') break;
  }

  print('\nHistórico:');
  for (var item in historico) {
    print(item);
  }
}
