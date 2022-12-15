
import '../../models/FavModel.dart';

abstract class StateHome {}

class IntialHomeState extends StateHome {}

class ChangeBottomNav extends StateHome {}

class onLoadingHome extends StateHome {}

class onSucessHome extends StateHome {}

class onErrorHome extends StateHome {}
class onSucessCategories extends StateHome {}

class onErrorCategories extends StateHome {}
class FavTogelLifght extends StateHome{
 final FavouriteModel? model;
 FavTogelLifght(this.model);



}

class OnChangeFavSucess extends StateHome{}
class OnChangeFavError extends StateHome{}
class GetFavLoading extends StateHome{}

class GetFavSucess extends StateHome{}
class GetFavError extends StateHome{}





