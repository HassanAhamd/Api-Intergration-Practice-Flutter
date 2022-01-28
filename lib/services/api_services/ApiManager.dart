
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_app_flutter/constants/Strings.dart';
import 'package:new_app_flutter/models/BuyCoinsModel.dart';
import 'package:new_app_flutter/models/NewsInfoModel.dart';


class ApiManager{

  Future<BuyCoinsModel?> getPackages() async {
    BuyCoinsModel? buyCoinsModel;
    var client = http.Client();
    try{
      var response =  await client.get(Uri.parse(Strings.baseUrl));
      if(response.statusCode == 200){
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        buyCoinsModel = BuyCoinsModel.fromJson(jsonMap);
      }
    }catch(e){
      print("Exception $e and Data $buyCoinsModel");
      return buyCoinsModel;
    }
    print("Success and Data $buyCoinsModel");
    return buyCoinsModel;
  }

  Future<NewInfoModel?> getNews() async {
    NewInfoModel? _newInfoModel;
    var client = http.Client();
    try{
      var response =  await client.get(Uri.parse(Strings.baseUrlNewsApi));
      if(response.statusCode == 200){
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        _newInfoModel = NewInfoModel.fromJson(jsonMap);
      }
    }catch(e){
      print("Exception $e and Data $_newInfoModel");
      return _newInfoModel;
    }
    print("Success and Data $_newInfoModel");
    return _newInfoModel;
  }

}