
import 'package:http/http.dart' as http;

class RequestUtil{
  final endponit1='https://davaivala.shop/';
  final token='Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MjIxNjM4NDAsImlhdCI6MTY5MDYyNzg0MCwic2NvcGUiOiJhY2Nlc3NfdG9rZW4iLCJzdWIiOiJhY2MwNiJ9.D9wDOUSPuy0RX_QOH0Zhx8QiSZ1GLo3jfoaHvRj39tE';

  Future<http.Response> roomList() async{
    return  http.get(Uri.parse(endponit1+'room_list/'),
      headers: {'Authorization': token},
    );
  }
  Future<http.Response> cityList() async{
    return  http.get(Uri.parse(endponit1+'get_city_list/'),
      headers: {'Authorization': token},
    );
  }
}