class FavouriteModel
{
  late bool status;
   String? message;
  FavouriteModel.jasondata(Map<String,dynamic>jason)
  {
    status=jason['status'];
    message=jason['message'];
  }


}