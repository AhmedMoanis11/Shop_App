class ShopLoginData {
  late bool status;
  late String message;
   UserLogin? data;

  ShopLoginData.JasonDatashop(Map<String,dynamic>jason)
  {
    status = jason['status'];
    message = jason['message'];
    data = jason['data']!=null? UserLogin.JasonData(jason['data']) :null ;

  }
}

class UserLogin {
   int? id;
  String? name;
  String? email;
  String? phone;
   String? image;
  int? points;
  int? credit;
   String? token;



  UserLogin.JasonData(Map<String, dynamic> jason) {
    id = jason['id'];
    name = jason['name'];
    email = jason['email'];
    phone = jason['phone'];
    image = jason['image'];
    points = jason['points'];
    credit = jason['credit'];
    token = jason['token'];
  }
}
