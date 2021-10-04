import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();

  final firebase = FirebaseFirestore.instance;

  create()async{
    try{
      await firebase
          .collection("User")
          .doc(name.text)
          .set({
        "name":name.text,
        "number":number.text,
      });
    }catch(e){
      print(e);
    }
  }
  update()async{
    try{
      firebase.collection("User").doc(name.text).update({
        'number': number.text,
      });
    }catch(e){
      print(e);
    }
  }
  delete()async{
    try{
      firebase.collection("User").doc(name.text).delete();
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crud Operations'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: "User Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: number,
                decoration: InputDecoration(
                  labelText: "Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      create();
                      name.clear();
                      number.clear();
                    },
                    child: Text(
                      'Create',
                    ),
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: () {
                      update();
                      name.clear();
                      number.clear();
                    },
                    child: Text(
                      'Update',
                    ),
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      delete();
                      name.clear();
                      number.clear();
                    },
                    child: Text(
                      'Delete',
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 300,
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: firebase.collection("User").snapshots(),
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, i){
                              QueryDocumentSnapshot x =
                              snapshot.data!.docs[i];
                              return ListTile(
                                title: Text(x['name']),
                                subtitle: Text(x['number']),
                              );
                            });
                      }else{
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
