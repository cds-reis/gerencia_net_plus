const mockCreateImmediateChargeMap = {
  'calendario': {
    'criacao': mockDateString,
    'expiracao': 3600,
  },
  'txid': '7978c0c97ea847e78e8849634473c1f1',
  'revisao': 0,
  'loc': locationMap,
  'location': 'pix.example.com/qr/v2/9d36b84fc70b478fb95c12729b90ca25',
  'status': 'ATIVA',
  'devedor': debtorMap,
  'valor': {
    'original': '567.89',
  },
  'chave': 'a1f4102e-a446-4a57-bcce-6fa48899c1d1',
  'solicitacaoPagador': 'Informe o número ou identificador do pedido.'
};

const mockInvalidMap = <String, dynamic>{};

const mockDateString = '2020-09-09T20:15:00.358Z';

const locationMap = {
  'id': 789,
  'location': 'pix.example.com/qr/v2/9d36b84fc70b478fb95c12729b90ca25',
  'tipoCob': 'cob',
  'criacao': mockDateString,
};

const debtorMap = {
  'cnpj': '12345678000195',
  'nome': 'Empresa de Serviços SA',
};
