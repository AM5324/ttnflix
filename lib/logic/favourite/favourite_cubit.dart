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

  Future<void> fetchFavouritesData() async {
    List<Results> favouriteList = manager.getList<Results>('favouriteList', Results.fromJson);
    emit(FavoriteLoaded(
      favouriteList: favouriteList,
    ));
  }

  saveFavourite(Results results) async {
    var favLoadedState = state as FavoriteLoaded;
    List<Results> favouriteList = [];
    if (results.isFavourite) {

      favouriteList = favLoadedState.favouriteList
          ?.where((favResults) {
        if (favResults.id == results.id) {
          results.isFavourite = false;
          return false;
        }
        return true; // Include this element in the new list
      })
          .toList() ?? [];

      await manager.removeList('favouriteList');
      await manager.saveList(
        'favouriteList',
        favouriteList.map((fav) => fav.toJson()).toList(),
      );
      fetchFavouritesData();

    }
  }
}
