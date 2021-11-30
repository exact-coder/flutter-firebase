import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: DBEx(),
  ));
}

class DBEx extends StatefulWidget{
  _state createState()=> _state();
}

class _state  extends State<DBEx>{
  Future fetchAllPost() async{
    print('fetch');
    final mydata = FirebaseFirestore.instance;
    mydata.collection("Countries").get().then((value) =>
        value.docs.forEach((element) { element.data();
        print(element.data());
        }
        ));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
      ),
      body: FutureBuilder(
        future: fetchAllPost(),
        builder: (_,AsyncSnapshot snapshot){
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (ctx,index){
              DocumentSnapshot dataa = snapshot.data[index];
              return ListTile(
                title: Text(dataa['title']),
              );
            },
          );
        },
      ),
    );
  }
}