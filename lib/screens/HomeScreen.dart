import 'package:flutter/material.dart';
import 'package:new_app_flutter/models/BuyCoinsModel.dart';
import 'package:new_app_flutter/models/NewsInfoModel.dart';
import 'package:new_app_flutter/services/api_services/ApiManager.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
  }

class _HomeScreenState extends State<HomeScreen> {
   late Future<BuyCoinsModel?> _buyCoinsModel;
  // late Future<NewInfoModel?> _newsInfoModel;

  @override
  void initState() {
     _buyCoinsModel = ApiManager().getPackages() ;
    // _newsInfoModel = ApiManager().getNews() ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Integration Practice',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: FutureBuilder<BuyCoinsModel?>(
        future: _buyCoinsModel,
        builder: (context,data){
          if(data.hasData){
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: ListView.builder(
                  itemCount: data.data?.data.length,
                  itemBuilder: (context,index){
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                    ),

                  height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                  Text("Buy ${data.data?.data[index].coins} Coins"),
                      Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("Price ${data.data?.data[index].price}"),
                        SizedBox(width: 5,),
                        Text("OldPrice ${data.data?.data[index].price}",style: TextStyle(color: Colors.red,fontSize: 10),),
                    ],),
                    Text("${data.data?.data[index].description}",maxLines: 2,),
                    Text("Discount ${data.data?.data[index].discount} %")
                ],),);}),
            );
          } else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}