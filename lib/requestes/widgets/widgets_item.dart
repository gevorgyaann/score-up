import 'package:application/requestes/models/request.dart';
import 'package:flutter/material.dart';

class RequestItem extends StatelessWidget {
  final Request request;

  const RequestItem({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      child: SizedBox(
        // height: 300,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(children: [
                Image.asset(
                  request.image,
                  width: 32,
                  height: 32,
                ),
               const SizedBox(width: 10,),
               const Text("Էվոկա բանկ", style: TextStyle(
                 fontSize: 16,
               )),
              ],),


              ListTile(title: const Text(
                "Տեսակ`",
                style: TextStyle(fontSize: 16, color: Colors.black),

              ),
                subtitle: Text(
                    request.type
                ),

              ),


              ListTile(title: const Text(
                "Նպատակ`",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),

                subtitle: Text(
                    request.purpose
                ),

              ),

              ListTile(title: const Text(
                "Ամսաթիվ՝",
                  style: TextStyle(fontSize: 16),
              ),
                subtitle: Text("${request.date.day}.${request.date.month}.${request.date.year}"),
              ),

               ListTile(title:const Text(
              "Ազդեցություն՝",
                style: TextStyle(fontSize: 16),
               ),
                subtitle: Row(children: [
                  Image.asset(
                    request.icons,
                    width: 32,
                    height: 32,
                  ),
                  const SizedBox(width: 10,),
                  const Text("Չի ազդում", style: TextStyle(
                    fontSize: 16,
                  )),
                ],),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
