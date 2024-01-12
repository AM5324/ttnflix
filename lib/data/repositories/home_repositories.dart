
import 'package:ttn_flix/data/models/movie.dart';
import 'package:ttn_flix/data/network/api/api_endpoint.dart';

import '../di/ttn_flix_service_locator.dart';
import '../network/dio_api_client.dart';

class HomeRepository {
  late DioApiClient _apiService;

  HomeRepository(){
    _apiService = TTNFlixSL.get<DioApiClient>();
  }

  Future<MovieResponse> getMoviesData(int pageNo) async {
    final response = await _apiService.getDataFromApi(
        endpoint: ApiEndpoint.baseUrl,
        converter: MovieResponse.fromJson,
        queryParams: {"api_key": ApiEndpoint.apiKey, "page": pageNo});
    return response;
  }


}
