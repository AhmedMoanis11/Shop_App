import 'package:shop_app/models/ModelLogin.dart';

abstract class ShoppingApp{}
class IntialStates extends ShoppingApp
{

}
class onLoadingLogin extends ShoppingApp{}
class onsucessLogin extends ShoppingApp{
  final ShopLoginData LoginMode;

  onsucessLogin(this.LoginMode);


}
class onErrorLogin extends ShoppingApp{
  final String Error;

  onErrorLogin(this.Error);

}

class showpass extends ShoppingApp{}

