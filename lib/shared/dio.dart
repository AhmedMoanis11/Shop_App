import 'package:dio/dio.dart';

class Dioinfo {
  static late Dio dios;

  static init() {
    dios = Dio(
      BaseOptions(
        baseUrl:'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers:
          {
            'Content-Type':'application/json',
          }
      ),
    );
  }

  static Future<Response> GetData({
  required String urll,
      Map<String,dynamic>? queries,
    String?token,
    String?lang
})
  async
  {
    dios.options.headers=
    {
      'Content-Type':'application/json',
      'lang':'en',
      'Authorization':token,
    };
    return await dios.get(urll,queryParameters:queries );

  }

  static Future<Response> PostData({
    required String urll,
     required Map<String,dynamic> data,
     Map<String,dynamic>? queries,
    String?token,
    String?lang
  })
  async
  {
    dios.options.headers=
    {
      'Content-Type':'application/json',
      'lang':'en',
      'Authorization':token,
    };
    return await dios.post(urll,data: data);
  }


}
//required String urll,
//     required Map<String,dynamic> queries