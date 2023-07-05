import 'dart:convert';

import 'package:gerencia_net_plus/src/pix/models/devolution.dart';

class PixPayment {
  final String endToEndId;
  final String txid;
  final double value;
  final String pixKey;
  final DateTime paymentTime;
  final String? payerInfo;
  final List<Devolution>? devolutions;

  const PixPayment({
    required this.endToEndId,
    required this.txid,
    required this.pixKey,
    required this.value,
    required this.paymentTime,
    this.payerInfo,
    this.devolutions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'endToEndId': endToEndId,
      'txid': txid,
      'valor': value.toStringAsFixed(2),
      'chave': pixKey,
      'horario': paymentTime.toIso8601String(),
      'infoPagador': payerInfo,
      'devolucoes': devolutions?.map((d) => d.toMap()).toList()
    };
  }

  factory PixPayment.fromMap(Map<String, dynamic> map) {
    List<dynamic>? devolutionJson = map['devolucoes'];
    List<Devolution>? devolutions;
    if (devolutionJson != null) {
      devolutions = devolutionJson.map((d) => Devolution.fromMap(d)).toList();
    }

    return PixPayment(
      endToEndId: map['endToEndId'] as String,
      txid: map['txid'] as String,
      value: double.parse(map['valor']),
      pixKey: map['chave'],
      paymentTime: DateTime.parse(map['horario']),
      payerInfo: map['infoPagador'],
      devolutions: devolutions,
    );
  }

  String toJson() => json.encode(toMap());

  factory PixPayment.fromJson(String source) =>
      PixPayment.fromMap(json.decode(source) as Map<String, dynamic>);
}
