
import '../di/ttn_flix_service_locator.dart';
import '../network/dio_api_client.dart';

class HomeRepository {
  late DioApiClient _apiService;

  HomeRepository(){
    _apiService = TTNFlixSL.get<DioApiClient>();
  }




}
