import 'package:banglore_task_app/modelclass/customerclass/customer_model_class.dart';
import 'package:flutter/material.dart';

import 'custombottom.dart';

class nextpage extends StatefulWidget {

  final CustomerEstimateFlow detail;

  const nextpage({super.key, required this.detail});

  @override
  State<nextpage> createState() => _nextpageState();
}

class _nextpageState extends State<nextpage> {

  int _currentIndex = 1;

  void _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
            onPressed: (){
                Navigator.pop(context);
            },
          ),
          title: Text("New Leads"),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Items"),
              Tab(text: "Floor Info"),
              Tab(text: "Send Quote"),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.detail.items!.inventory!.length,
                    itemBuilder: (context, index){

                    return Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300
                        ),
                        child: ExpansionTile(
                          backgroundColor: Colors.white,
                          title: Text(
                          widget.detail.items!.inventory![index].name.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          children: [
                            Column(
                              children:
                                List.generate(
                                    widget.detail.items!.inventory![index]!.category!.length, (categoryIndex){

                                  if (categoryIndex >= widget.detail.items!.inventory![index].category!.length) {
                                    return SizedBox(); // Return an empty widget or handle gracefully
                                  }

                                      return ListTile(
                                        leading: Icon(Icons.table_restaurant,size: 20,),
                                        title: Text(widget.detail.items!.inventory![index].category![categoryIndex].name.toString(),style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 20),),
                                        subtitle: Text("Medium",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                                        trailing: Text(widget.detail.items!.inventory![index].category![categoryIndex].items.length.toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
                                      );
                                    }),
                            )
                          ],
                        ),
                      ),
                    );
                   }
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300
                  ),
                  child: ExpansionTile(
                    backgroundColor: Colors.white,
                    title: Text(
                      "Custom Items",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[100], // Background color
                          borderRadius: BorderRadius.circular(8.0), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: Offset(0, 2), // Shadow position
                            )
                          ],
                        ),
                         child: SizedBox(
                           height: 110,
                           child: ListView.builder(
                            itemCount: widget.detail.items!.customItems!.items!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.detail.items!.customItems!.items![index].itemName.toString(),
                                      style: TextStyle(fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      widget.detail.items!.customItems!.items![index].itemDescription.toString(),
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly,
                                      children: [
                                        Text("L: ${widget.detail.items!.customItems!.items![index].itemLength.toString()} ft", style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                        Text("W: ${widget.detail.items!.customItems!.items![index].itemWidth.toString()} ft", style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                        Text("H: ${widget.detail.items!.customItems!.items![index].itemHeight.toString()} ft", style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }
                                                   ),
                         ),
                      //),
                      //
                  // Divider(thickness: 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      ),
                      child: Center(child: Text("Existing house details",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600,fontSize: 20),)),
                    ),
                  ),
                  ListTile(
                    title: Text("Floor no",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.w500),),
                    trailing: Text(widget.detail.old_floor_no.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700)),
                  ),
                  ListTile(
                    title: Text("Elevator Avaliability",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.w500),),
                    trailing: Text(widget.detail.old_elevator_availability.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700)),
                  ),
                  ListTile(
                    title: Text("Packing Required.",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.w500),),
                    trailing: Text(widget.detail.packing_service.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700)),
                  ),
                  ListTile(
                    title: Text("Distance from door to truck",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.w500),),
                    trailing: Text(widget.detail.old_parking_distance.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700)),
                  ),
                  ListTile(
                    title: Text("Additional Information",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.w500),),
                    subtitle: Text(widget.detail.old_house_additional_info.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(height: 5,),
              
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      ),
                      child: Center(child: Text("New house details",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600,fontSize: 20),)),
                    ),
                  ),
                  ListTile(
                    title: Text("Floor No.",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.w500),),
                    trailing: Text(widget.detail.new_floor_no.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700)),
                  ),
                  ListTile(
                    title: Text("Elevator Avaliability",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.w500),),
                    trailing: Text(widget.detail.new_elevator_availability.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700)),
                  ),
                  ListTile(
                    title: Text("Unpacking Required.",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.w500),),
                    trailing: Text(widget.detail.unpacking_service.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700)),
                  ),
                  ListTile(
                    title: Text("Distance from door to truck",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.w500),),
                    trailing: Text(widget.detail.new_parking_distance.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700)),
                  ),
                  ListTile(
                    title: Text("Additional Information",style: TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.w500),),
                    subtitle: Text(widget.detail.new_house_additional_info.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ),
            Text("Send Quote"),
          ],
        ),

        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onBottomNavTap,
        ),
      ),
    );
  }
}
