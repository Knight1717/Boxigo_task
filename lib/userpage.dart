import 'package:banglore_task_app/page2.dart';
import 'package:banglore_task_app/service/servicepage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'custombottom.dart';
import 'modelclass/customerclass/customer_model_class.dart';

class userpage extends StatefulWidget {
  const userpage({super.key});

  @override
  State<userpage> createState() => _userpageState();
}

class _userpageState extends State<userpage> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  int _currentIndex = 1; // Leads is selected by default

  void _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;

    });
  }

  String? formatmonth(String datstr) {
    DateTime dateTime = DateTime.parse(datstr);
    String formattedmonth = DateFormat("MMM").format(dateTime);
    return formattedmonth;
  }

  String? formatday(String datstr) {
    DateTime dateTime = DateTime.parse(datstr);
    String formattedmonth = DateFormat("d").format(dateTime);
    return formattedmonth;
  }

  String? formathour(String datstr) {
    DateTime dateTime = DateTime.parse(datstr);
    String formattedhour = DateFormat("HH:mm").format(dateTime);
    return formattedhour;
  }


  final service get_Details = service();

  List<CustomerEstimateFlow> details = [];

  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    Get_Appdata();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> Get_Appdata() async{
    var responsedata = await get_Details.getservice();

    setState(() {
      if(responsedata != null){

       details = responsedata;

      }
    });

  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 4,
      child: Scaffold(

        appBar: AppBar(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/c.png"),
                fit: BoxFit.fill,
              )
            ),
          ),
          title: Text("Leads"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.notifications_none),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.search),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,

            indicatorColor: Colors.red,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            
            tabs: [
              Tab(text: "All"),
              Tab(text: "New"),
              Tab(text: "Follow up",),
              Tab(text: "Booked"),
            ],
          ),
        ),

        body: TabBarView(
          controller: _tabController,
          children: [
            Center(child: Text("All items")),  //tab 1

           ListView.builder(                    //tab 2
            itemCount: details!.length,
            itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                formatmonth(details[index].order_date.toString()).toString(),
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                formatday(details[index].order_date.toString()).toString(),
                                style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                formathour(details[index].order_date.toString()).toString(),
                                style: TextStyle(color: Colors.grey.shade800,fontSize: 17),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Banglore",
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  details[index].moving_from.toString(),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              // border: Border.all(color: Colors.black)
                            ),
                            child: Text(
                              details[index].estimate_id.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.arrow_downward,size: 50,color: Colors.red,),
                          Column(
                            children: [
                              Icon(Icons.home, size: 30, color: Colors.red),
                              SizedBox(height: 4),
                              Text(details[index].property_size.toString(),style: TextStyle(fontSize: 15)),
                            ],
                          ),
          
          
                          Column(
                            children: [
                              Icon(Icons.inventory, size: 30, color: Colors.red),
                              SizedBox(height: 4),
                              Text(details[index].total_items.toString(),style: TextStyle(fontSize: 15),),
                            ],
                          ),
          
                          Column(
                            children: [
                              Icon(Icons.inbox, size: 30, color: Colors.red),
                              SizedBox(height: 4),
                              Text("20 boxes",style: TextStyle(fontSize: 15)),
                            ],
                          ),
          
                          Column(
                            children: [
                              Icon(Icons.location_on, size: 30, color: Colors.red),
                              SizedBox(height: 4),
                              Text(details[index].distance.toString(),style: TextStyle(fontSize: 15)),
                            ],
                          ),
          
                        ],
                      ),
                      SizedBox(height: 30,),
          
          
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start, // Ensure top alignment
                        children: [
                          SizedBox(width: 50,),
                          // Location and Address column (repeating for next section)
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Banglore",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                 details[index].moving_to.toString(),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
          
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: 10,),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>  nextpage(detail: details[index],)));
                            },
                            child: Container(
                                child: Text('View Details')),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                                side: BorderSide(color: Colors.red, width: 1),
                              ),
                              foregroundColor: Colors.red,
                              // backgroundColor: Colors.grey[300],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Submit Quote',style: TextStyle(color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                                backgroundColor: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
                }
          ),


            Center(child: Text("Follow up")),    //tab 3

            Center(child: Text("Booked")),    //tab 4
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
