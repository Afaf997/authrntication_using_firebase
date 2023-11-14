import 'package:flutter/material.dart';

Widget buildFormStudent({String? text,int? addEditFlag, String? docId}){
  return   Container(
               child: SingleChildScrollView(
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                           children: [
                          const Stack(
                            children: [
                            ],), 
                           const SizedBox(height:50 ,),
                           Form(child: Column(
                            children: [
                              TextFormField(decoration: InputDecoration(
                                border: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(100),
                                ),
                                label: Text("Full Name"),prefixIcon: Icon(Icons.person_outline_rounded),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: BorderSide(width: 2,color: Colors.black)
                                )),
                              ),const SizedBox(height: 15,),
                               TextFormField(decoration:InputDecoration(
                                 border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                 ),
                                label:const Text("Age"),prefixIcon: Icon(Icons.numbers),
                                 focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide:const BorderSide(width: 2,color: Colors.black)
                                )),
                                ),const SizedBox(height: 15,),
                                 TextFormField(decoration: InputDecoration(
                                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),),
                                label:const Text("Email"),prefixIcon:const Icon(Icons.email),
                                 focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide:const BorderSide(width: 2,color: Colors.black)
                                )),
                                ),const SizedBox(height: 15,),
                                 TextFormField(decoration:InputDecoration(
                                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),),
                                label:const Text("Phone Number"),prefixIcon:const Icon(Icons.phone),
                                 focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide:const BorderSide(width: 2,color: Colors.black)
                                )),
                                ),const SizedBox(height: 20,),
                                SizedBox(
                                  height: 40,
                                  width: double.infinity,
             
                                  child: ElevatedButton(onPressed: (){
                                  
                                  
                                  }
                                  ,style: ElevatedButton.styleFrom(
                                    backgroundColor:Colors.black,side: BorderSide.none,shape: StadiumBorder()
                                  ),
                                   child:const Text("Submit",style: TextStyle(color: Colors.white,fontSize: 18),)),
                                )
                            ],
                           ))])),
                    )),
             );
}