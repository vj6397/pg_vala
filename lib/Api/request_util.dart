import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/location_list.dart';

class RequestUtil{
  final endpoint='https://davaivala.shop/';
  //final token=ktoken;
  final token = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MjIxNjM4NDAsImlhdCI6MTY5MDYyNzg0MCwic2NvcGUiOiJhY2Nlc3NfdG9rZW4iLCJzdWIiOiJhY2MwNiJ9.D9wDOUSPuy0RX_QOH0Zhx8QiSZ1GLo3jfoaHvRj39tE';

  Future<http.Response> resendOtp (number){
    return http.post(Uri.parse(endpoint+'resend_otp?contact=$number&user_type=landlord'));
  }

  Future<http.Response> login(number, otp){
    return http.post(Uri.parse(endpoint+'app_login'),
        headers: {"accept": "application/json",
          "Content-Type": "application/json"},
        body: jsonEncode ({"contact": number, "otp": otp,"user_type": "landlord"}));
  }

  Future<http.Response> roomList() async{
    return  http.get(Uri.parse(endpoint+'room_list/'),
      headers: {'Authorization': token},
    );
  }
  Future<http.Response> payment_status() async{
    return  http.get(Uri.parse(endpoint+'payment-status/'),
      headers: {'Authorization': token},
    );
  }
  Future<http.Response> visitTime() async{
    return  http.get(Uri.parse(endpoint+'visting_client/'),
      headers: {'Authorization': token},
    );
  }

  Future<http.Response> cityList() async{
    return  http.get(Uri.parse(endpoint+'get_city_list/'),
      headers: {'Authorization': token},
    );
  }
  Future<http.Response> ownerDetail()  async{
    return http.get(Uri.parse(endpoint+'accommodation_detail/'),
      headers: {'Authorization': token},
    );
  }
  Future<http.Response> update(roomid,field,value) async{
    return  http.put(Uri.parse(endpoint+'room_detail_update/?roomid=$roomid&field=$field&value=$value'),
      headers: {'Authorization': token},
    );
  }
  Future<http.Response> updateDetail(roomid,field,value) async{
    return  http.put(Uri.parse(endpoint+'room_detail_update/?roomid=$roomid&field=$field&value=$value'),
      headers: {'Authorization': token},
    );
  }
  Future<http.Response> sales_logIn(sales_id,password)async{
    return http.put(Uri.parse(endpoint+'sales_login/?sales_id=$sales_id&password=$password'),
        headers: {'Authorization': token},
    );
  }

}