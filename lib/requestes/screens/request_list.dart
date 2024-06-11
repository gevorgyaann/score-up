import 'package:application/requestes/models/request.dart';
import 'package:application/requestes/widgets/widgets_item.dart';
import 'package:flutter/material.dart';

class RequestList extends StatefulWidget {
  const RequestList({super.key});

  @override
  State<RequestList> createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {
  String name = "";
  List<Request> requestList = [];

  @override
  void initState() {
    super.initState();
    requestList.add(Request(
      image: "assets/images/ev.png",
      name: "Էվոկա բանկ",
      type: "ՖԱՅԿՈ Սքոր զեկույց",
      purpose: "Նոր վարկի դիմում",
      date: DateTime.now(),
      icons: "assets/icons/hand.png",
      effect: "Չի ազդում",
    ));
    requestList.add(Request(
      image: "assets/images/bank.png",
      name: "Այ Դի բանկ",
      date: DateTime.now(),
      type: "ՖԱՅԿՈ Սքոր զեկույց",
      icons: "assets/icons/hand.png",
      effect: "Չի ազդում",
      purpose: "Նոր վարկի դիմում",
    ));
    requestList.add(Request(
      image: "assets/images/layer.png",
      name: "Ակբա բանկ",
      date: DateTime.now(),
      type: "ՖԱՅԿՈ Սքոր զեկույց",
      icons: "assets/icons/hand.png",
      effect: "Չի ազդում",
      purpose: "Նոր վարկի դիմում",
    ));
    requestList.add(Request(
      image: "assets/images/ev.png",
      name: "Արարատ բանկ",
      date: DateTime.now(),
      type: "ՖԱՅԿՈ Սքոր զեկույց",
      icons: "assets/icons/hand.png",
      effect: "Չի ազդում",
      purpose: "Նոր վարկի դիմում",
    ));
    requestList.add(Request(
      image: "assets/images/bank.png",
      name: "Արդշին բանկ",
      date: DateTime.now(),
      type: "ՖԱՅԿՈ Սքոր զեկույց",
      icons: "assets/icons/hand.png",
      effect: "Չի ազդում",
      purpose: "Նոր վարկի դիմում",
    ));
    requestList.add(Request(
      image: "assets/images/layer.png",
      name: "Արցախ բանկ",
      date: DateTime.now(),
      type: "ՖԱՅԿՈ Սքոր զեկույց",
      icons: "assets/icons/hand.png",
      effect: "Չի ազդում",
      purpose: "Նոր վարկի դիմում",
    ));
    requestList.add(Request(
      image: "assets/images/bank.png",
      name: "Ինեկո բանկ",
      date: DateTime.now(),
      type: "ՖԱՅԿՈ Սքոր զեկույց",
      icons: "assets/icons/hand.png",
      effect: "Չի ազդում",
      purpose: "Նոր վարկի դիմում",
    ));
    requestList.add(Request(
      image: "assets/images/ev.png",
      name: "Կոնվերս բանկ",
      date: DateTime.now(),
      type: "ՖԱՅԿՈ Սքոր զեկույց",
      icons: "assets/icons/hand.png",
      effect: "Չի ազդում",
      purpose: "Նոր վարկի դիմում",
    ));
    requestList.add(Request(
      image: "assets/images/bank.png",
      name: "Յունի բանկ",
      date: DateTime.now(),
      type: "ՖԱՅԿՈ Սքոր զեկույց",
      icons: "assets/icons/hand.png",
      effect: "Չի ազդում",
      purpose: "Նոր վարկի դիմում",
    ));
    requestList.add(Request(
      image: "assets/images/ev.png",
      name: "Ֆասթ բանկ",
      date: DateTime.now(),
      type: "ՖԱՅԿՈ Սքոր զեկույց",
      icons: "assets/icons/hand.png",
      effect: "Չի ազդում",
      purpose: "Նոր վարկի դիմում",
    ));
    requestList.add(Request(
      image: "assets/images/layer.png",
      name: "ՎՏԲ բանկ",
      date: DateTime.now(),
      icons: "assets/icons/hand.png",
      effect: "Չի ազդում",
      type: "ՖԱՅԿՈ Սքոր զեկույց",
      purpose: "Նոր վարկի դիմում",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top:false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.topCenter,
            child: Text('Հարցումներ',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          toolbarHeight: 150,
          centerTitle: false,

          backgroundColor: Colors.blue,
          shape:
              ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
          flexibleSpace: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: ("Որոնել"),
                  fillColor: Colors.white70,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
              ),
            ),
          ),

        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return RequestItem(
              request: requestList[index],
            );
          },
          itemCount: requestList.length,
        ),
      ),
    );
  }
}
