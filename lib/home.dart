 import 'package:ai_image_generator/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

   @override
   State<HomePage> createState() => _HomePageState();
 }

 class _HomePageState extends State<HomePage> {
  String size="256x256";
  var textController=TextEditingController();
  String image='';
  var isLoading=false;

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: Text(
           "AI Image Generator",
           style: TextStyle(
             fontWeight: FontWeight.bold,
             color: Colors.white
           ),
         ),
       ),
       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(

           children: [
             Container(
               height: 200,
               width:400,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                            Container(
                               height:50,
                               width:350,
                               padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(15.0)
                               ),
                               child: TextFormField(
                                 controller: textController,
                                 decoration: InputDecoration(
                                   hintText: 'A monkey on moon',
                                   border: InputBorder.none
                                 ),
                               ),
                             ),
                       SizedBox(height: 15,),
                       SizedBox(
                         height: 44,
                         width: 150,
                         child: ElevatedButton(
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.deepPurple,
                             shape: StadiumBorder()
                           ),
                             onPressed: ()async{
                             if(textController.text.isNotEmpty){
                               image = await Api.generateImage(textController.text, size);
                               setState(() {
                                 isLoading=true;
                               });
                               textController.clear();
                             }else {

                             }
                             },
                             child: Text(
                               "Generate"
                             )),
                       )
                     ],
                   ),
                 ),


               Expanded(
                 flex: 3,
                 child: isLoading?
                 Container(
                     alignment: Alignment.center,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(12),
                       color: Colors.white10,
                     ),
                     child: Image.network(image,fit: BoxFit.contain,)
                 ):
                         Container(
                           alignment: Alignment.center,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(12),
                             color: Colors.white,
                           ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               SizedBox(
                                 height: 150,
                                   width: 150,
                                   child: Image.asset("assete/images/loader.gif",scale: 1,)
                               ),
                               Text("Waiting for image to be generated.....",style: TextStyle(
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.blueAccent,
                               ),)

                             ],
                           )
                         ),
                     ),


           ],
         ),
       ),
     );
   }
 }
