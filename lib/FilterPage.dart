import 'package:demoproject/utility.dart';
import 'package:flutter/material.dart';




class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, 
         color: Colors.black,
        ),
        centerTitle: true,
        title: Text("Filter Product",
        style: text.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w600
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
               fileterType(),
               filindex == 0 ?
               selectFilter()
                :
               selectFilter2()
              // Column(
              //   children: [
              //     Text("Type",
              //      style: text.copyWith(
              //       fontSize: 14,

              //      ),
              //     )
              //   ],
              // )

          ],
        ),
      ),

      bottomNavigationBar: Container(
         height: 50,
         decoration: BoxDecoration(
          border: Border(top:  BorderSide(width: 1, color: Colors.grey.shade300 ),
 )
         ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             Text("RESET"),
             RotatedBox(
              quarterTurns: 3,
               child: Divider(
                height: 30,
                
               ),
             ),
             Text("APPLY")
          ],
        ),
      ),
     );
  }

  bool _isChecked = true;
  String _currText = '';


   final Map<String, bool> _map = {
     "Trackpants" : false,
     "Blazers" : false,
     "Sweaters" : false,
     "Sweatshirts" : false,
     "T-Shirts" : false,
   };

    final Map<String, bool> _map2 = {
     "Shirts" : false,
     "Trackpants" : false,
     "Blazers" : false,
     "Sweatshirts" : false,
     "Sweaters" : false,
   };

  int _count = 0;
  int filindex = 0;

  Widget selectFilter(){
    return Container(
            // height: 350.0,
            width: 200,
            child:
          ListView(
            shrinkWrap: true,
        children: _map.keys
            .map(
              (key) => CheckboxListTile(
                 
                //  visualDensity: VisualDensity.comfortable,
                controlAffinity: ListTileControlAffinity.leading,
                value: _map[key],
                checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),

                      side: BorderSide(
                         width: 0.2,
                         color: Colors.black,
                         style: BorderStyle.solid,


                      )
                      ),
                
                onChanged: (value) => setState(() => _map[key] = value!),
                title: Text(key,
                 style: text.copyWith(
                  fontSize: 12
                 ),
                ),
                // subtitle: Text(key),
              ),
            )
            .toList(),
      ),
    );
          // );
  }

 
    Widget selectFilter2(){
    return Container(
            // height: 350.0,
            width: 200,
            child:
          ListView(
            shrinkWrap: true,
        children: _map2.keys
            .map(
              (key) => CheckboxListTile(
                 
                //  visualDensity: VisualDensity.comfortable,
                controlAffinity: ListTileControlAffinity.leading,
                value: _map2[key],
                checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),

                      side: BorderSide(
                         width: 0.2,
                         color: Colors.black,
                         style: BorderStyle.solid,


                      )
                      ),
                
                onChanged: (value) => setState(() => _map2[key] = value!),
                title: Text(key,
                 style: text.copyWith(
                  fontSize: 12
                 ),
                ),
                // subtitle: Text(key),
              ),
            )
            .toList(),
      ),
    );
          // );
  }

  bool checkColors = false;
  Widget fileterType (){
    return Container(
       height: double.infinity,
       width: 150,
       
      //  padding: EdgeInsets.symmetric(horizontal: 15 ),
      child: ListView.builder(
        //  separatorBuilder: (context, index) => 
        //     Divider(),
         itemCount: fileter.length,
         shrinkWrap: true,
         
        itemBuilder: (context, index) {
         return    GestureDetector(
          onTap: (){
              filindex = index;
              checkColors = true;
              setState(() {
                
              });
          },
           child: Container(
            
             child: Container(
                  height: 45,
                  width: 100,
              decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(  color: Colors.grey.withOpacity(0.2),
              
              width: 1.7
               )
                ),
                color:
                 filindex == index  ? Colors.white :
                 Color(0xffE4E4E4)
              ),
              padding: EdgeInsets.symmetric( vertical: 10,
               horizontal: 15
               ),
             
               child: Text(fileter[index],
                           style: text.copyWith(
                            fontSize: 14,
         
                           )),
             ),
           ),
         );
      }, ),
    );
  }

 List<String>  fileter =[
  "Type"
  "Size",
  "Brand",
  "Price",
  "Color",
  "Discount"
 ];
 
 
}