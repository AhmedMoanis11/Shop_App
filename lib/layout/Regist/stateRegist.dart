import '../../models/ModelLogin.dart';

abstract class RegistState{}
class IntialStateRegist extends RegistState{}
class OnSucessRegist extends RegistState{
  final ShopLoginData LoginMode;

  OnSucessRegist(this.LoginMode);


}
class OnErrorRegist extends RegistState{
  final String Error;

  OnErrorRegist(this.Error);

}
class OnLoadingRegist extends RegistState{}

class showReistpass extends RegistState{}
