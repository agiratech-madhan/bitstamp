import 'package:bitsnap/src/services/networking/api_endpoint.dart';
import '../../../services/networking/api_service.dart';
import '../domainModels/bitsnap_model.dart';
import '../../../services/bitsnap_services.dart';

class BitSnapRepository implements BitSnapServices {
  final ApiService _apiService = ApiService();
  @override
  Future<SingleBitsnapResponse> getSingleBitsnap({String? searchValue}) async {
    return await _apiService.getDocumentData(
        endpoint:
            ApiEndpoint.bitsnap(BitsnapEndPoint.TICKER, searchValue ?? ''),
        converter: (response) {
          final data = SingleBitsnapResponse.fromJson(response);
          return data;
        });
  }
}
