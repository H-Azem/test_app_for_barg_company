import 'package:barg_flutter_test/models/user_model.dart';
import 'package:barg_flutter_test/view_models/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:get/get.dart';
class HomeView extends StatelessWidget {
   HomeView({Key? key}) : super(key: key);

  final controller = Get.put(UsersViewModel());

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(title: Row(
      children: const [
        CircleAvatar(),
        SizedBox(width: 10,),
        Text('user'),
      ],
    ),backgroundColor: Colors.amberAccent,foregroundColor: Colors.black,),
      body: Container(
        child: false ? _skeletonView() : _contentView(),
      ),
    );
  }

  Widget _skeletonView() => ListView.builder(
    // padding: padding,
    physics: NeverScrollableScrollPhysics(),
    itemCount: 50,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(color: Colors.white),
        child: SkeletonItem(
            child: Column(
              children: [
                Row(
                  children: [
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        shape: BoxShape.circle,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: SkeletonParagraph(
                        style: SkeletonParagraphStyle(
                            lines: 2,
                            spacing: 6,
                            lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 10,
                              borderRadius: BorderRadius.circular(8),
                              minLength: MediaQuery.of(context).size.width / 6,
                              maxLength: MediaQuery.of(context).size.width / 3,
                            )),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 1,
                      spacing: 6,
                      lineStyle: SkeletonLineStyle(
                        randomLength: true,
                        height: 10,
                        borderRadius: BorderRadius.circular(8),
                        minLength: MediaQuery.of(context).size.width / 2,
                      )),
                ),


              ],
            )),
      ),
    ),
  );

  Widget _contentView() => FutureBuilder(
   future: controller.getData(),
   builder: (context,AsyncSnapshot snapshot) {
     List<UserModel> data = snapshot.data;
     print(444);
     print(data);
     return ListView.builder(
       padding: EdgeInsets.symmetric(horizontal: 8.0),
       itemCount: data.length,
       itemBuilder: (context, index) =>
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: InkWell(
               onTap: (){
                 print(587458);
                 controller.goToProfile();
               },
               child: Container(

                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           CircleAvatar(),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.all(2.0),
                                 child: Text(
                                   '${data[index].name}',
                                   style: TextStyle(color: Colors.black),
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.all(2.0),
                                 child: Text(
                                   '${data[index].email}',
                                   style: TextStyle(color: Colors.black),
                                 ),
                               ),
                             ],
                           ),
                         ],
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text('Address: ${data[index].address}',
                           overflow: TextOverflow.ellipsis,
                         ),
                       )
                     ],
                   ),
                 ),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(color: Colors.black, spreadRadius: 1),
                   ],
                 ),
                 height: 97,
               ),
             ),
           ),
     );
   } );
}
