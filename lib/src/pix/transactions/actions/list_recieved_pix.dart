import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../../config/utils/date_extensions.dart';
import '../../../config/utils/map_extensions.dart';
import 'models/recieved_pix_pagination.dart';

class ListRecievedPix {
  final GerenciaNetPlusPixRestClient _client;

  const ListRecievedPix(this._client);

  Future<RecievedPixPagination> call({
    required DateTime start,
    required DateTime end,
    required String? txid,
    required bool? hasTxid,
    required bool? hasDevolution,
    required String? cpf,
    required String? cnpj,
    required int? currentPage,
    required int? pageSize,
  }) async {
    final params = <String, dynamic>{
      'inicio': start.toRFC3339(),
      'fim': end.toRFC3339(),
    }..addAllIfNotNull({
        'txid': txid,
        'txIdPresente': hasTxid,
        'devolucaoPresente': hasDevolution,
        'cpf': cpf,
        'cnpj': cnpj,
        'paginacao.paginaAtual': currentPage,
        'paginacao.itensPorPagina': pageSize,
      });

    final endpoint = _client.pixEndPoints.transactions.listReceivedPix();

    final result = await _client<Map<String, dynamic>>(
      endPoint: endpoint,
      queryParameters: params,
    );

    return RecievedPixPagination.fromMap(result.data!);
  }
}
