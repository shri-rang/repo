import 'package:carousel_slider/carousel_slider.dart';
import 'package:demoproject/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
     int _current = 0;
  final CarouselController _controller = CarouselController();
    final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  // 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

  final List<String> bannerImg = [
    "assets/banner.png",
    "assets/banner2.png"
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
    .map((item) => Container(
      width: double.infinity,
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(10.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: double.infinity,
                     height: 400,
                    ),
                    // Positioned(
                    //   bottom: 0.0,
                    //   left: 0.0,
                    //   right: 0.0,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //         colors: [
                    //           Color.fromARGB(200, 0, 0, 0),
                    //           Color.fromARGB(0, 0, 0, 0)
                    //         ],
                    //         begin: Alignment.bottomCenter,
                    //         end: Alignment.topCenter,
                    //       ),
                    //     ),
                    //     padding: EdgeInsets.symmetric(
                    //         vertical: 10.0, horizontal: 20.0),
                    //     child: Text(
                    //       'No. ${imgList.indexOf(item)} image',
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 20.0,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                )),
          ),
        ))
    .toList();

    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,

       title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
          
           Image.asset("assets/logo.png",
           width: 17,
           height: 20,
           ),
           
           Padding(
             padding: const EdgeInsets.only(   top: 5 ),
             child: Text("ADUZ FASHION",
              style: GoogleFonts.quicksand(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
             ),
           ),
         ],
       ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              searchBox(),
              SizedBox(
                height: 10,
              ),
             Container(
              width: double.infinity,
              height: 120,
               child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:listProduct.length ,
                
                shrinkWrap: true,
                itemBuilder:
                 ((context, index) {
                   return   circularProduct(index, listProduct );
                 })
                 ),
             ),
      
            // Expanded(
          // child: 
          CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
      
            
            options: CarouselOptions(
                height: 400,
                viewportFraction: 0.9,

                // disableCenter: true,

                // initialPage: 1,
                enableInfiniteScroll: false,
                
                // autoPlay: true,
                // enlargeCenterPage: true,
                // aspectRatio: 1.0,
      
      
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 50.0,
                height: 5.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      
                decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(5),
                    shape: BoxShape.rectangle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
             SizedBox(
            height: 10,
          ),
         Container(
          width: double.infinity,
          height:70 ,
          padding: EdgeInsets.symmetric(   horizontal: 15 ),
           child: ListView.builder(
             itemCount: bannerImg.length,
              scrollDirection: Axis.horizontal,
            itemBuilder:  
             (context, index) {
               return  bannerWidget(index, bannerImg);
             },
            ),
         ),
            Container(
              width: double.infinity,
              height:70 ,
              padding: EdgeInsets.symmetric(   horizontal: 15 ),
              child: ListView.builder(
                itemCount: bannerImg.length,
                scrollDirection: Axis.horizontal,
                itemBuilder:
                    (context, index) {
                  return  bannerWidget(index, bannerImg);
                },
              ),
            ),
          SizedBox(
            height: 10,
          ),
        
         commanText("Clearance Sale", "5000 + Styles Up to 50% off" ),
          SizedBox(
            height: 10,
          ),
         productList(),
          SizedBox(
            height: 10,
          ),
         commanText("Brands", "Explore 100+ brands" ),
          SizedBox(
            height: 10,
          ), 
         productGrids(productGrid),
          SizedBox(
            height: 10,
          ),
         commanText("Popular In Categories", "Explore what we offer " ),
           SizedBox(
            height: 10,
          ), 
          catGrids(categaroiesGrid),
            SizedBox(
            height: 10,
              ),
         commanText("New Arrivals", "5000 + Styles Up to 40% off " ),
           SizedBox(
            height: 10,
              ),
         productList(),
           SizedBox(
            height: 10,
              ),
         commanText("Recently Viewed", "Don't think twice to bag it" ),
            SizedBox(
            height: 10,
              ),
         productList(),
             SizedBox(
            height: 20,
              ),
          bottomWidget(),
           SizedBox(
            height: 50,
              ),
          ],
        ),
      ),

    ); 
  }






List<int> list = [1, 2, 3, 4, 5];

 List<String> listProduct = [
   "Men",
   "Women",
   "Kids",
   "Beauty",
   "Accessories"

 ];
  List<String> listProductImage = [
  "assets/slider.png",
  "assets/women.png",
  "assets/kids.png",
  "assets/beauty.png",
  "assets/accessories.png",
 ];

 List<String>  products = [
  "assets/product0.png",
  "assets/product1.png",
  "assets/product2.png",
 ]
 ;

  List<String>  productGrid = [
  "assets/adidas.png",
  "assets/puma.png",
  "assets/celio.png",
  "assets/terrain.png",
  "assets/roadser.png",
  "assets/wrangler.png",
  "assets/adidas.png",
  "assets/puma.png",
  "assets/celio.png",
 ]
 ;
 


  List<String>  categaroiesGrid = [
  "assets/clothing.png",
  "assets/footware.png",
  "assets/jackets.png",
  "assets/makeup.png",
  "assets/enthicwear.png",
  "assets/access.png",
 ]
 ;


  Widget searchBox(){
    return  Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 15 ),
      width: double.infinity,
      child: TextFormField(
        decoration: InputDecoration(

          prefixIcon:  Icon(Icons.search, 
           color: Colors.black,
          ), 
          filled: true,
          fillColor: Color(0xffF0F0F0),
         
          border: 
             OutlineInputBorder(
               borderSide: BorderSide(
                width: 0, 
                style: BorderStyle.none,
                ),
          borderRadius: BorderRadius.circular(7.0),
        ),
        hintText: "Search for product brand..",
        hintStyle: GoogleFonts.quicksand(
            color: Colors.grey,
            fontSize: 12
          )
          // labelText: "Search for product brand..",
          // labelStyle: GoogleFonts.quicksand(
          //   color: Colors.grey
          // )
          // preffixIcon:
        ),
      ),
    );
  }


   Widget bannerWidget(int index, List<String> img){
         return   
             ClipRRect(
  borderRadius: BorderRadius.circular(10), // Image border
  child: Image.asset(img[index], 
   width: 340,
   height: 70,
  fit: BoxFit.cover),
);
 
   }


  Widget circularProduct(int index, List<String> name ){
     return Column(
         children: [
           CircleAvatar(
              radius: 45,
              backgroundColor: Colors.white,
              child: ClipOval(
                child:
                 Image.asset(listProductImage[index],
                  fit: BoxFit.cover,
     width: 80,
     height: 80,
                 ),
  ),
           ),
           SizedBox(
             height: 2,
           ),
           Text(name[index],
           style: GoogleFonts.quicksand(
             fontSize: 12
           ),
           )
         ],
     );
  }
  
  Widget commanText(String title, String subTitle,){
    return 
    Padding(
      padding: const EdgeInsets.symmetric( horizontal: 15 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text( title,
                  // "Clearance Sale",
                 style: text.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                 ),
                ),
                  Text("See All",
                 style: text.copyWith(
                  fontSize: 16,
                 ),
                )
              ],
            ),
               SizedBox(
              height: 10,
            ),
            Text(
              subTitle,),
              // "5000 + Styles Up to 50% off"),
              SizedBox(
              height: 10,
            ),
        ],
      ),
    );
  }

 Widget productList(){
  return Padding(
    padding: const EdgeInsets.symmetric( horizontal: 15 ),
    child: Container(
      width: double.infinity,
      height: 180,
      child: ListView.builder(
        
         itemCount: products.length,
         shrinkWrap: true,
         scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
           return Stack(
             children: [
               Container(
                margin: EdgeInsets.only(   right: 15 ),
                child: Column(
                  children: [
                    Image.asset(products[index]),
                      SizedBox(
                        height: 8,
                        ),
                    Text("Rib Button Draw..",
                    style: text.copyWith(
                      fontSize: 12,
                    ),

                    ),
                    SizedBox(
                        height: 5,
                        ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                      children: [
                        Text("Rs 1250",
                        style: text.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                        ),
                        
                        )
                        ,
                        SizedBox(
                          width: 8,
                        ),
                            Text("Rs 2360",
                        style: text.copyWith(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.lineThrough
                        ),
                        
                        )
                      ],
                    ) 
                  ],
                ),
               ),
                   Positioned(
              //  right: ,
              left: 80,
                top: 100,
              child: Container(
                 width: 30,
                 height: 30,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                   color: Colors.white,
                ),
                child: Image.asset("assets/shopping.png",
                 height: 20,
                 width: 20,
                ),
              ),
            )
             ],
           );
        }, ),
    ),
  );
   
 }




 Widget productGrids( List<String> product ){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10 ),
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        
        crossAxisCount: 3,
        childAspectRatio: 1.7,
        // mainAxisSpacing: 10,
        // crossAxisSpacing: 10,


        
        ),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
     itemCount: product.length,
     itemBuilder: (context, index) {
       return Container(
        height: 100,
        child: Image.asset(product[index]),
       );
    } ),
  );
 }


  Widget catGrids( List<String> product ){
  return Padding(
    padding:  const EdgeInsets.symmetric(horizontal: 10 ),
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        
        crossAxisCount: 3,
        childAspectRatio: 0.99,
        mainAxisSpacing: 20,
        // crossAxisSpacing: 10,


        
        ),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
     itemCount: product.length,
     itemBuilder: (context, index) {
       return Container(
        height: 100,
        child: Image.asset(product[index]),
       );
    } ),
  );
 }


 Widget bottomWidget(){
  return Padding(
    padding: const EdgeInsets.symmetric(  horizontal: 15 ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        iconWithText("On Time Delivery", "assets/truck.svg"),
        iconWithText("Secure Payment", "assets/secure.svg"),
        iconWithText("Easy Reaturn", "assets/return.svg"),
      ],
    ),
  );
 }

 Widget iconWithText(String title, String icon){
  return  Column(
        children: [
          SvgPicture.asset(icon),
          SizedBox(
            height: 10,
          ),
          Text(title,
           style: text.copyWith(
            fontSize: 12
           ),
          )
        ],
      );
 }


}






