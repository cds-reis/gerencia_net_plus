import '../../../config/http_client/gerencia_net_plus_pix_rest_client.dart';

class CancelWebhook {
  final GerenciaNetPlusPixRestClient _client;

  const CancelWebhook(this._client);

  Future<void> call(String pixKey) async {
    final endpoint = _client.pixEndPoints.webhook.pixDeleteWebhook(pixKey);

    await _client<Map<String, dynamic>>(endPoint: endpoint);
  }
}
