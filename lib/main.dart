import 'package:appcrud/firebase/helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/LoginScreen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
}
//
// class LoginScreen extends StatelessWidget {
//   Service service = Service();
//  TextEditingController emailController = TextEditingController();
//  TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:SafeArea(
//         child: Column(
//           children: [
//             Container(
//               margin: EdgeInsets.only(bottom: 20),
//               height: 120,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   bottomRight: Radius.circular(45),
//                   bottomLeft: Radius.circular(45),
//                 ),
//                 color: Colors.grey.withOpacity(0.10),
//               ),
//               child: Center(
//                 child: Text(
//                     "Login Account",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 30,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller:emailController,
//                 decoration: InputDecoration(
//                   labelText: "Enter Your Email",
//                   border:OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                   labelText: "Enter Your Password",
//                   border:OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomRight,
//               child: TextButton(
//                 onPressed: () {},
//                 child: Text(
//                     'Reset Password ?',
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               style: TextButton.styleFrom(
//                 padding: EdgeInsets.symmetric(horizontal: 80),
//                 backgroundColor: Colors.green.withOpacity(0.5),
//               ),
//                 onPressed: () {
//                   if(emailController.text.isNotEmpty &&
//                      passwordController.text.isNotEmpty){
//                     service.loginUser(
//                       emailController.text,
//                       passwordController.text,
//                       context);
//                   }else{
//                     service.error(context, 'Field must not be empty');
//                   }
//
//                 },
//                 child: Text("Login"),
//             ),
//             TextButton(onPressed: () {
//               Navigator.push(context, MaterialPageRoute(
//                   builder:(context)=>ResisterScreen()));
//             },
//                 child: Text("Don't have any account?")),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ResisterScreen extends StatelessWidget {
//   Service service = Service();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:SafeArea(
//         child: Column(
//           children: [
//             Container(
//               margin: EdgeInsets.only(bottom: 20),
//               height: 120,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   bottomRight: Radius.circular(45),
//                   bottomLeft: Radius.circular(45),
//                 ),
//                 color: Colors.grey.withOpacity(0.10),
//               ),
//               child: Center(
//                 child: Text(
//                   "Resister Account",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller:emailController,
//                 decoration: InputDecoration(
//                   labelText: "Enter Your Email",
//                   border:OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                   labelText: "Enter Your Password",
//                   border:OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//               ),
//             ),
//
//             ElevatedButton(
//               style: TextButton.styleFrom(
//                 padding: EdgeInsets.symmetric(horizontal: 80),
//                 backgroundColor: Colors.green.withOpacity(0.5),
//               ),
//               onPressed: () {
//                 if(emailController.text.isNotEmpty &&
//                     passwordController.text.isNotEmpty){
//                   service.createUser(
//                       emailController.text,
//                       passwordController.text,
//                       context);
//                 }else{
//                   service.error(context, 'field must not be empty');
//                 }
//               },
//               child: Text("Register"),
//             ),
//             TextButton(onPressed: () {
//               Navigator.push(context, MaterialPageRoute(
//                   builder:(context)=>LoginScreen()));
//             },
//                 child: Text("Already have account?")),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//   TextEditingController name = TextEditingController();
//   TextEditingController number = TextEditingController();
//
//   final firebase = FirebaseFirestore.instance;
//
//   create()async{
//     try{
//       await firebase
//           .collection("User")
//           .doc(name.text)
//           .set({
//         "name":name.text,
//         "number":number.text,
//       });
//     }catch(e){
//       print(e);
//     }
//   }
//   update()async{
//     try{
//       firebase.collection("User").doc(name.text).update({
//         'number': number.text,
//       });
//     }catch(e){
//       print(e);
//     }
//   }
//   delete()async{
//     try{
//       firebase.collection("User").doc(name.text).delete();
//     }catch(e){
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Crud Operations'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               TextField(
//                 controller: name,
//                 decoration: InputDecoration(
//                   labelText: "User Name",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15),
//               TextField(
//                 controller: number,
//                 decoration: InputDecoration(
//                   labelText: "Number",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     style: TextButton.styleFrom(backgroundColor: Colors.green),
//                       onPressed: () {
//                         create();
//                         name.clear();
//                         number.clear();
//                       },
//                       child: Text(
//                         'Create',
//                       ),
//                   ),
//                   ElevatedButton(
//                     style: TextButton.styleFrom(backgroundColor: Colors.amber),
//                     onPressed: () {
//                       update();
//                       name.clear();
//                       number.clear();
//                     },
//                     child: Text(
//                       'Update',
//                     ),
//                   ),
//                   ElevatedButton(
//                     style: TextButton.styleFrom(backgroundColor: Colors.red),
//                     onPressed: () {
//                       delete();
//                       name.clear();
//                       number.clear();
//                     },
//                     child: Text(
//                       'Delete',
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 width: double.infinity,
//                 height: 300,
//                 child: SingleChildScrollView(
//                   physics: ScrollPhysics(),
//                   child: StreamBuilder<QuerySnapshot>(
//                     stream: firebase.collection("User").snapshots(),
//                     builder: (context, snapshot){
//                       if(snapshot.hasData){
//                         return ListView.builder(
//                             shrinkWrap: true,
//                             physics: ScrollPhysics(),
//                             itemCount: snapshot.data!.docs.length,
//                             itemBuilder: (context, i){
//                               QueryDocumentSnapshot x =
//                               snapshot.data!.docs[i];
//                              return ListTile(
//                                title: Text(x['name']),
//                                subtitle: Text(x['number']),
//                              );
//                             });
//                       }else{
//                         return Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




