import 'package:flutter/material.dart';
class MoviesListBuilder extends StatelessWidget {
  List<dynamic> list;
  String routeName;
  var args;
  var item;
  MoviesListBuilder({super.key, required this.list,required this.routeName,required this.args,required this.item});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:1,
          crossAxisSpacing:0,
          mainAxisExtent:125
        ),
        itemCount:list.length,
        scrollDirection:Axis.horizontal,
        itemBuilder:(context,index){
          return Padding(
            padding:
            const EdgeInsets.only(left: 16),
            child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.pushNamed(
                      context, routeName,
                      arguments:args[index]);
                  //print('pressed✔️');
                },
                child:item
            ),
          );
        }
    );
  }
}
