import '../features/home/domainModels/bitsnap_model.dart';

abstract class BitSnapServices {
  Future<SingleBitsnapResponse> getSingleBitsnap({String searchValue});
}
