import 'package:demoproject/Home.dart';
import 'package:demoproject/utility.dart';
import 'package:flutter/material.dart';




class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
     
     return Scaffold(
      // appBar: 


      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // border: Border.all(),
            color: Color(0xffFAFAFA)
          ),
          padding: EdgeInsets.only( top: 15 ),
          child: Column(
            children: [
      
                expansion()
             
            ],
          ),
        ),
      ),
     );

  }

 
     bool isExpand = false;
  Widget expansion(){
   
    return 
     Column(
      children: [
         ListView.separated(
          shrinkWrap: true,
          itemCount: productList.length,
          separatorBuilder: (context, index) {
            return  Divider();
          },
          itemBuilder: ((context, index) {
           return   ExpansionTile(
            // controlAffinity: ListTileControlAffinity.platform
             
             onExpansionChanged: (value) {
               
                   isExpand =    value;
                   setState(() {
                     print("aa $isExpand"); 
                   });
            },
            backgroundColor: Color(0xffFAFAFA),
            collapsedBackgroundColor: Color(0xffFAFAFA),

       trailing:
       isExpand ? Image.asset("assets/arrowup.png",
        height: 6,
        width: 9,
        fit: BoxFit.fill,
       ):
        Image.asset("assets/arrowd.png",
             height: 6,
        width: 9,
        fit: BoxFit.fill,
        ),       
  title: Text(
    productList[index],
    style: text.copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500
    ),
  ),
  subtitle: Text(subproductList[index],
  style: text.copyWith(
    fontSize: 14
  ),
  ),
  // collapsedTextColor: Colors.black,
  
  children:
   <Widget>[
   ListView.builder(
        shrinkWrap: true,
         itemCount: clothList.length,
        itemBuilder: (context, index) {
         return   
           Container(
            // padding: EdgeInsets.all(5), 
            margin: EdgeInsets.all(5),

            decoration: BoxDecoration(
              color:Colors.white ,
              // border: Border.all()
            ),
            
             child: ListTile(
              tileColor: Colors.white,
        
          trailing:   Image.asset("assets/arrowforward.png",
        height: 7,
        width: 13,
        fit: BoxFit.fill,
        ), 
        title: Text(
              clothList[index],
          style: text.copyWith(
              fontSize: 14
          ),
        ),
        ),
           );
         }  ),
  ],
);
         })  ),
        

      ],
     );
  }

 
 List<String> clothList = [
  "Casual",
  "Formal",
  "Shorts",
  "T-shirts",
  "Sweatshirts"
 ];


  List<String> productList = [
  "Colthing",
  "Bottomwear",
  "Footwear",
  "Winterwear",
  "SummerWear",
   "EnthicWear"
 ];


  List<String> subproductList = [
  "Casual, Formal , T-shirts, Shorts, Sweatshirt",
  "Casual, Formal, Jeans, Joggers, Shorts ",
  "Casual, Formal , Sandles, Flipflops ",
  "Jackets, Sweaters, Gloves",
  "T-Shirts, Goggles",
  "Caual, Formal , T-shirts, Shorts, Sweatshirts"
 ];




}