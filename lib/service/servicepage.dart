import 'package:dio/dio.dart';
import '../modelclass/customerclass/customer_model_class.dart';


class service {
  final Dio _dio = Dio();

  Future<List<CustomerEstimateFlow>?> getservice() async{
    try{
      List<CustomerEstimateFlow>  details = [];

      Response response = await _dio.get("http://test.api.boxigo.in/sample-data/");

      if(response.statusCode == 200){
        var data = response.data['Customer_Estimate_Flow'];

        for(var element in data) {
            details.add(CustomerEstimateFlow.fromJson(element));
        }
        print(details);
        print("hiiiii");
        return details;
      }
      else{
        print("byee");
        return details;
      }
    }
    catch(e){
      print(e.toString());
      print("tata");
    }
  }
}
