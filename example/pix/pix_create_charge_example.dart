import 'package:gerencia_net_plus/gerencia_net_plus.dart';
import 'package:gerencia_net_plus/src/pix/models/additional_info.dart';
import 'package:gerencia_net_plus/src/pix/models/debtor.dart';

import '../base_credentials.dart';

Future<void> main(List<String> args) async {
  final gerenciaNetPlus = GerenciaNetPlus(credentials: baseCredentials);
  final result = await gerenciaNetPlus.pix.createCharge(
    expiration: Duration(days: 10),
    value: 5.99,
    debtor: LegalPersonDebtor(
      name: 'Empresa de Serviços SA',
      cnpj: '12345678000195',
    ),
    payerSolicitation: 'Informe o número ou identificador do pedido.',
    additionalInfo: [
      AdditionalInfo(
        name: 'Campo 1',
        value: 'informação adicional 1 do PSP-Recebedor',
      ),
      AdditionalInfo(
        name: 'Campo 2',
        value: 'informação adicional 2 do PSP-Recebedor',
      ),
    ],
  );

  print(result.toMap());
}
