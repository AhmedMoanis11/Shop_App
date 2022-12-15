class CategoriesModel
{
 late bool status;
 CategoriesData? data;
 CategoriesModel.jasondata(Map<String,dynamic>jason)
 {
  status=jason['status'];
   data=CategoriesData.jasondata(jason['data']);

 }




}
class CategoriesData
{
  int? current_page;
 List<DataModel>? data=[];
  CategoriesData.jasondata(Map<String,dynamic>jason)
  {
   current_page=jason['current_page'];


   jason['data'].forEach((element) {
    data?.add(DataModel.jasondata(element));
   });
  }



}
class DataModel
{
int?id;
String?name;
String?image;

DataModel.jasondata(Map<String,dynamic>jason)
{
 id=jason['id'];
 name=jason['name'];
 image=jason['image'];
}

}

