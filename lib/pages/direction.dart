import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pickrunner/models/order_model.dart';
import 'package:pickrunner/pages/collect_parcel.dart';
import 'package:pickrunner/widget/big_text.dart';
import 'package:pickrunner/widget/button_widget.dart';
import 'package:pickrunner/widget/card_widget.dart';
import 'package:pickrunner/widget/order_display_widget.dart';

class Direction extends StatefulWidget {
  String driverUid;
  double c_lat, c_lng, p_lat, p_lng;
  Direction({Key? key, required this.driverUid, required this.c_lat, required this.c_lng, required this.p_lat, required this.p_lng}) : super(key: key);

  @override
  State<Direction> createState() => _DirectionState();
}

class _DirectionState extends State<Direction> {
  OrderModel? _activeOrder;
  GoogleMapController? mapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPiKey = "AIzaSyBLdWndJ3LzSROLrd-e3Mo_AaaeP6WwOCk";
  
  Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction
  double distance = 0.0;
    late double? pLat = widget.c_lat;
    late double? pLng = widget.c_lng;
    late double? dLat = widget.p_lat;
    late double? dLng = widget.p_lng;
  late LatLng startLocation = LatLng(pLat!, pLng!);
  late LatLng endLocation = LatLng(dLat!, dLng!);

  @override
void initState() {
  super.initState();
  _fetchActiveOrder(widget.driverUid);
  markers.add(Marker( //add start location marker
        markerId: MarkerId(startLocation.toString()),
        position: startLocation, //position of marker
        infoWindow: InfoWindow( //popup info 
          title: 'Starting Point ',
          snippet: 'Start Marker',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add distination location marker
        markerId: MarkerId(endLocation.toString()),
        position: endLocation, //position of marker
        infoWindow: InfoWindow( //popup info 
          title: 'Destination Point ',
          snippet: 'Destination Marker',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      
      getDirections();
}
getDirections() async {
      List<LatLng> polylineCoordinates = [];
     
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          googleAPiKey,
          PointLatLng(startLocation.latitude, startLocation.longitude),
          PointLatLng(endLocation.latitude, endLocation.longitude),
          travelMode: TravelMode.driving,
      );

      if (result.points.isNotEmpty) {
            result.points.forEach((PointLatLng point) {
                polylineCoordinates.add(LatLng(point.latitude, point.longitude));
            });
      } else {
         print(result.errorMessage);
      }

      //polulineCoordinates is the List of longitute and latidtude.
      double totalDistance = 0;
      for(var i = 0; i < polylineCoordinates.length-1; i++){
           totalDistance += calculateDistance(
                polylineCoordinates[i].latitude, 
                polylineCoordinates[i].longitude, 
                polylineCoordinates[i+1].latitude, 
                polylineCoordinates[i+1].longitude);
      }
      print(totalDistance);

      setState(() {
         distance = totalDistance;
      });

      //add to the list of poly line coordinates
      addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 + 
          cos(lat1 * p) * cos(lat2 * p) * 
          (1 - cos((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
    
  }

void _fetchActiveOrder(String currentDriverId) {
  FirebaseFirestore.instance
      .collection('orders')
      .where('status', isEqualTo: 'Active')
      .where('driverUid', isEqualTo: currentDriverId)
      .get()
      .then((QuerySnapshot snapshot) {
    if (snapshot.docs.isNotEmpty) {
      final data = snapshot.docs.first.data();
      final order = OrderModel.fromMap(data);
      setState(() {
        _activeOrder = order;
      });
    }
  });
}
  @override
  Widget build(BuildContext context) {
    print(widget.driverUid);
    print(widget.c_lat);
    print(widget.c_lng);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            Center(
              child: Text(
                'Order ID: ${_activeOrder?.orderId}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Stack(
                children: [
                  Expanded(
                    child: Container(
                      width: 315,
                        height: 400,
                        //BoxDecoration Widget
                        decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ), //Border.all
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(
                            2.0,
                            2.0,
                          ), //Offset
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        child: GoogleMap(
                          zoomGesturesEnabled: true, //enable Zoom in, out on map
                          initialCameraPosition: CameraPosition( //innital position in map
                            target: startLocation, //initial position
                            zoom: 9.5, //initial zoom level
                          ),
                          markers: markers, //markers to show on map
                          polylines: Set<Polyline>.of(polylines.values), //polylines
                          mapType: MapType.normal, //map type
                          onMapCreated: (controller) { //method called when map is created
                            setState(() {
                              mapController = controller; 
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 310,
                    left: 15,
                    right: 15,
                    child: Card( 
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Text("Total Distance: " + distance.toStringAsFixed(2) + " KM",
                                    style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold))
                      ),
                    )
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            
            const Divider(
              indent: 15,
              endIndent: 15,
              thickness: 2,
            ),
            SizedBox(height: 5,),
            BigText(title: "Pickup Point", size: 20,),
            SizedBox(height: 10,),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                
                Expanded(
                  child: Column(
                    children: [
                      OrderDisplayWidget(line: "Address: ", data: _activeOrder?.picAddress?? ""),
                      const SizedBox(
                        height: 12,
                      ),
                      const Divider(
                        indent: 15,
                        endIndent: 15,
                        thickness: 2,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 40),
                           child: const Icon(Icons.access_alarm),
                          ),
                          SizedBox(width: 12,),
                          BigText(title: _activeOrder?.picTime??"", size: 18, weight: FontWeight.normal,),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                     Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 40),
                           child: const Icon(Icons.mobile_friendly_outlined),
                          ),
                          SizedBox(width: 12,),
                          BigText(title: _activeOrder?.picMobno??"", size: 18, weight: FontWeight.normal,),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 40),
                           child: const Icon(Icons.person_2_outlined),
                          ),
                          SizedBox(width: 12,),
                          BigText(title: _activeOrder?.picName??"", size: 18, weight: FontWeight.normal,),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 40),
                           child: const Icon(Icons.integration_instructions_outlined),
                          ),
                          SizedBox(width: 12,),
                          BigText(title: _activeOrder?.picInstruct??"", size: 18, weight: FontWeight.normal,),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                    ],
                  ),
                ),
              ],
              ),
              SizedBox(height: 15,),
            const Divider(
              indent: 15,
              endIndent: 15,
              thickness: 2,
            ),
            SizedBox(height: 35,),
            Button_Widget(pressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CollectParcel(destiName: _activeOrder?.destiName?? "", destimobNo: _activeOrder?.destiMobno??"", email: _activeOrder?.email??"", mobNo: _activeOrder?.picMobno??"", name: _activeOrder?.picName??"", orderId: _activeOrder?.orderId??"", price: _activeOrder!.price!, driverUid: widget.driverUid, orderUid: _activeOrder?.uid??"",)));
            }, width: 270, text: "Collect Parcel"),
            ],
          ),
        ),
      );
  }
}