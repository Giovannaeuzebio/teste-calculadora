
class Numeros {
  static const operacoes = ['%', '/', '+', '-', 'x', '='];
  String _operacao='';
  bool _operacaoUsada = false;
  final _buffer = [0.0, 0.0];
  int _indiceBuffer = 0;

  String result = '0'; // Nome da variável atualizado para "result"



  void _limpar() {
    result = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _indiceBuffer = 0;
    _operacao = '';
    _operacaoUsada = false;
  }

  void applyCommand(String comando) { // Atualizado para "applyCommand"
    if (comando == 'AC') {
      _limpar();
    } else if (comando == 'DEL') {
      _apagarUltimoDigito();
    } else if (operacoes.contains(comando)) {
      _definirOperacao(comando);
    } else {
      _adicionarDigito(comando);
    }
  }

  void _apagarUltimoDigito() {
    if (result.length > 1) {
      result = result.substring(0, result.length - 1);
    } else {
      result = '0';
    }
    _buffer[_indiceBuffer] = double.tryParse(result) ?? 0.0;
  }

  void _adicionarDigito(String digito) {
    if (_operacaoUsada) result = '0';

    if (result.contains('.') && digito == '.') return;
    if (result == '0' && digito != '.') result = '';

    result += digito;
    _buffer[_indiceBuffer] = double.tryParse(result) ?? 0.0;
    _operacaoUsada = false;
  }

  void _definirOperacao(String operacao) {
    if (_operacaoUsada && operacao == _operacao) return;

    if (_indiceBuffer == 0) {
      _indiceBuffer = 1;

      if (operacao == '=') {
        _operacao = operacao;
      }
    } else {
      _buffer[0] = _calcular();
      _indiceBuffer = 1;
    }

    if (operacao != '=') {
      _operacao = operacao;
    }

    result = _buffer[0].toString();
    result = result.endsWith('.0') ? result.split('.')[0] : result;

    _operacaoUsada = true;
  }

  double _calcular() {
    switch (_operacao) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[1] == 0.0 ? double.nan : _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      default:
        return 0.0;
    }
  }
}