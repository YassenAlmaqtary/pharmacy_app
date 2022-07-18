//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
// class GazScreen extends StatefulWidget {
//   const GazScreen({Key? key}) : super(key: key);
//
//   @override
//   State<GazScreen> createState() => _GazScreenState();
// }
//
// class _GazScreenState extends State<GazScreen> {
//   String? gender;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:AppBar(
//         backgroundColor:Colors.deepOrangeAccent,
//       ),
//       body: SafeArea(
//         child: Container(
//           padding:const EdgeInsets.all(50),
//           color:Colors.white,
//           alignment:Alignment.center,
//           child:Column(
//             children: [
//              SizedBox(
//                height:MediaQuery.of(context).size.height*.15,
//                child: Column(
//                  children: [
//                    ListTile(
//                      title: Text("استلم"),
//                      leading: Radio(
//                          value: "استلم",
//                          groupValue: gender,
//                          onChanged: (value){
//                            setState(() {
//                              gender = value.toString();
//                            });
//                          }),
//                    ),
//                    ListTile(
//                      title: Text("لم يستلم"),
//                      leading: Radio(
//                          value: "لم يستلم",
//                          groupValue: gender,
//                          onChanged: (value){
//                            setState(() {
//                              gender = value.toString();
//                            });
//                          }),
//                    ),
//                  ],
//                ),
//              ),
//               rowBtn(name1:"النسبة المستحقة", name2: 'مندوب الشركة'),
//                const Spacer(),
//               rowBtn(name1:"هناك نقص",name2:"عد الاسطوانات المستلمة"),
//               const Spacer(),
//               bigBtn(name:"التعليقات والشكاوي"),
//               const Spacer(),
//               bigBtn(name:"تصفح"),
//             ],
//
//           ),
//
//         ),
//       ),
//     );
//   }
//
//   Widget customBtn({required String name}){
//     return  Container(
//       width:MediaQuery.of(context).size.width*.3,
//       height: MediaQuery.of(context).size.height*.15,
//       margin:const EdgeInsets.all(5),
//       decoration: BoxDecoration(
//           color:Colors.deepOrangeAccent,
//           borderRadius:BorderRadius.circular(15),
//       ),
//       padding:const EdgeInsets.all(15),
//
//       child:InkWell(
//         onTap:(){
//           showAlertDialog( context);
//         },
//         child: Column(
//           mainAxisAlignment:MainAxisAlignment.center,
//           children:  [
//             const Icon(Icons.map, color:Colors.white,),
//             const SizedBox(height:10,),
//             const Divider(height:1,thickness:3,color:Colors.white),
//             const SizedBox(height:2,),
//             Text(name,style:const TextStyle(
//                 color:Colors.white,
//             ),
//             textAlign:TextAlign.center,
//             ),
//           ],),
//       ),
//     );
//   }
//
//  Widget bigBtn({required String name}){
//     return  InkWell(
//       onTap:(){
//         showAlertDialog(context);
//       },
//       child: Container(
//         margin:const EdgeInsets.all(10),
//           alignment:Alignment.center,
//           child:Text(name,style:const TextStyle(
//           fontWeight:FontWeight.bold
//       )),
//    width:MediaQuery.of(context).size.width*.5,
//    height:MediaQuery.of(context).size.height*.06,
//    decoration:BoxDecoration(
//    borderRadius:BorderRadius.circular(20),
//    border:Border.all(color:Colors.deepOrangeAccent,width:2),
//    ),
//       ),
//     );
//
//  }
//
//
//   Widget rowBtn({required String name1,required String name2}){
//     return  Row(
//       mainAxisAlignment:MainAxisAlignment.center,
//       children: [
//         customBtn(name:name1),
//         const SizedBox(width: 20,),
//         customBtn(name:name2),
//       ],
//     );
//   }
//   showAlertDialog(BuildContext context) {
//     // Create button
//     Widget okButton = FlatButton(
//       child: Text("OK"),
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//     );
//
//     // Create AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text("Simple Alert"),
//       content: Text("This is an alert message."),
//       actions: [
//         okButton,
//       ],
//     );
//
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
// }
//
//
