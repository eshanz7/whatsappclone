import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whatsappclone/constants.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secColor,
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 40,
            width: 40,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Color(0xff3C4A55),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 15,),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: fbColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: const Icon(
              Icons.camera_enhance,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/aina.jpg',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: -5,
                    right: -5,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                          color: selectedColor, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Status",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                  Text(
                    "Tap to add status update",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: textColor),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Recent updates",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 14, color: textColor),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 20, top: 0),
            leading: CustomPaint(
              painter: CustomCircle(isNum: 4,isViewed: false),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/aina.jpg',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text("Emma Watson",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white)),
            subtitle: Text("Today, 07:58",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: textColor)),
          ),
          const SizedBox(
            height: 10,
          ),

          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Viewed updates",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 14, color: textColor),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (_,index){
            return    ListTile(
              contentPadding: EdgeInsets.only(left: 20, top: 0),
              leading: CustomPaint(
                painter: CustomCircle(isNum: index == 0 ? 2: index == 2 ?1:4 ,isViewed: true),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/aina.jpg',
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text("Emma Watson",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white)),
              subtitle: Text("Today, 07:58",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: textColor)),
            );
          },itemCount: 3,shrinkWrap: true,)

        ],
      ),
    );
  }
}

class CustomCircle extends CustomPainter {
  bool isViewed;

  int isNum;

  CustomCircle({this.isNum = 1, this.isViewed = false});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    final Paint paint = Paint()
      ..strokeWidth = 6
      ..isAntiAlias = true
      ..color =  !isViewed ? selectedColor :textColor
      ..style = PaintingStyle.stroke;

    addArc(paint, canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

  void addArc(Paint paint, Canvas canvas, Size size) {
    if (isNum == 1) {
      canvas.drawArc(Rect.fromLTWH(0, 0, size.width, size.height), dtoAngle(0),
          dtoAngle(360), false, paint);
    } else {
      double degree= -90;
      double arc = 360/ isNum;

      for(int x  = 0 ;  x < isNum ; x ++){
        canvas.drawArc(Rect.fromLTWH(0, 0, size.width, size.height), dtoAngle(degree + 4),
            dtoAngle(arc - 8), false, paint);

        degree +=  arc;
      }
    }
  }
}

dtoAngle(degree) {
  return pi * degree / 180;
}
