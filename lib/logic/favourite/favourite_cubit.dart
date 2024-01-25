import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/di/ttn_flix_service_locator.dart';
import '../../data/models/movie.dart';
import '../../data/shared_prefernce/shared_prefernce_manager.dart';
import '../../utils/ttn_flix_default_equatable.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavoriteLoading());
  SharedPreferencesManager manager = TTNFlixSL.get<SharedPreferencesManager>();


  Future<void> fetchFavouritesData() async {
    var gridList = manager.getList<Results>('userList', Results.fromJson);

    emit(FavoriteLoaded(
      gridList: gridList,
    ));

  }
}
