import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';
import '../../models/pix_recieved.dart';

class DetailRecievedPix {
  final GerenciaNetPlusPixRestClient _client;

  const DetailRecievedPix(this._client);

  Future<PixRecieved> call(String endToEndId) async {
    final endpoint =
        _client.pixEndPoints.transactions.detailRecievedPix(endToEndId);

    final result = await _client<Map<String, dynamic>>(endPoint: endpoint);

    return PixRecieved.fromMap(result.data!);
  }
}
