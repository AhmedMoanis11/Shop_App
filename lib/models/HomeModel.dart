
class HomeModel
{
  late bool status;
  String?message;
  HomeModelData?  data;

  HomeModel.JasonDatashop(Map<String,dynamic>jason)
  {
    status = jason['status'];
    data=HomeModelData.jasonData(jason['data']);

  }


}
class HomeModelData
{
  List<bannersModel>banners=[];
  List<productsModel>products=[];

  HomeModelData.jasonData(Map<String,dynamic>jason)
  {
    jason['banners'].forEach((element) {
      banners.add(bannersModel.jasonData(element));
    });
    jason['products'].forEach((element) {
      products.add(productsModel.jasonData(element));
    });

  }


}
class bannersModel
{
    int? id;
    String? image;
  bannersModel.jasonData(Map<String,dynamic>jason)
  {
    id=jason['id'];
    image=jason['image'];

  }


}
class productsModel
{
   int? id;
   dynamic  price;
  dynamic  old_price;
  dynamic  discount;
  String? image;
  String? name;
  bool? in_favorites;
  bool? in_cart;



  productsModel.jasonData(Map<String,dynamic>jason)
  {
    id=jason['id'];
    price=jason['price'];
    old_price=jason['old_price'];
    discount=jason['discount'];
    image=jason['image'];
    name=jason['name'];
    in_favorites=jason['in_favorites'];
    in_cart=jason['in_cart'];

  }
}