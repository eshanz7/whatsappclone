import 'package:flutter/material.dart';
import 'package:whatsappclone/constants.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: fbColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          const Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.archive_outlined,
                        color: textColor,
                      ),
                      SizedBox(
                        width: 26,
                      ),
                      Text(
                        "Archived",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Text(
                    "1",
                    style: TextStyle(
                        fontSize: 16,
                        color: selectedColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 12,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/aina.jpg',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      const Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Kate Winslet",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.white)),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.done,
                                        color: textColor,
                                        size: 14,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("i am going out",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: textColor)),
                                    ],
                                  )
                                ],
                              ),
                              Text("Yesterday",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: textColor)),
                            ],
                          )),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  );
                },
                itemCount: 40,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 20,
                  );
                },
              ))
        ],
      ),
      backgroundColor: secColor,
    );
  }
}
