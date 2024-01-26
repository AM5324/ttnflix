import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/di/ttn_flix_service_locator.dart';
import '../../data/models/movie.dart';
import '../../data/shared_prefernce/shared_prefernce_manager.dart';
import '../../utils/ttn_flix_default_equatable.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavoriteInitial());
  SharedPreferencesManager manager = TTNFlixSL.get<SharedPreferencesManager>();
  List<Results> favouriteList = [];
  getFavouriteList() async {
    favouriteList = manager.getList<Results>('favouriteList', Results.fromJson);
  }


  Future<void> fetchFavouritesData() async {
    getFavouriteList();
    emit(FavoriteLoaded(
      favouriteList: favouriteList,
    ));
  }

  saveFavourite(Results results) async {
    if (results.isFavourite != null && results.isFavourite == true) {
      for (Results favResults in favouriteList) {
        if (favResults.id == results.id) {
          results.isFavourite = null;
          favouriteList.remove(favResults);
          await manager.removeList('favouriteList');
          await manager.saveList(
              'favouriteList', favouriteList.map((fav) => fav.toJson()).toList());
          fetchFavouritesData();
        }
      }
    }
  }
}
