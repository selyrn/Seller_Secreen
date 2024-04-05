import 'package:flutter/material.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        title: Text(
          "Chat",
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "Cari Kontak Pembeli ",
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: const Color.fromARGB(255, 196, 195, 195),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.grey[800],
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Semua",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                //fontWeight: FontWeight.bold,
              ),
            ),
            //SizedBox(height: 0),
            Expanded(
              child: ListView.builder(
                itemCount: chatList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: CircleAvatar(
                        child: Text(chatList[index]['name'][
                            0]), // Menggunakan huruf pertama dari nama sebagai avatar
                      ),
                      title: Text(
                        chatList[index]['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      subtitle: Text(
                        "Hi, terimakasih telah menghubungi kami......", // Pesan standar untuk setiap chat
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            chatList[index]['time'],
                            style: TextStyle(
                              fontSize: 12,
                              // fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          if (chatList[index]['unread'] > 0)
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 15, 129, 221),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(6),
                                child: Text(
                                  chatList[index]['unread'].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      onTap: () {
                        // Aksi ketika item chat diklik
                        // Misalnya, buka halaman chat detail
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailPage(chatName)));
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> chatList = List.generate(25, (index) {
  final now = DateTime.now();
  final yesterday = DateTime(now.year, now.month, now.day - 1);
  final messageTime = DateTime(now.year, now.month, now.day - index);

  String hour = messageTime.hour > 12
      ? (messageTime.hour - 12).toString()
      : messageTime.hour.toString();
  String minute = messageTime.minute
      .toString()
      .padLeft(2, '0'); // Pad minutes with 0 if less than 10
  String ampm = messageTime.hour >= 12 ? 'PM' : 'AM';

  String timeString = "$hour:$minute $ampm";

  if (messageTime.isAtSameMomentAs(yesterday)) {
    timeString = "Kemarin";
  } else if (messageTime.isAfter(yesterday)) {
    timeString = "$timeString";
  } else {
    // Handle time format if it's not yesterday or today, as per your requirement.
  }

  // Generate random names
  List<String> names = [
    'John',
    'Alice',
    'Bob',
    'Eve',
    'Charlie',
    'Grace',
    'David',
    'Emma',
    'Frank',
    'Hannah'
  ];
  String name =
      names[index % names.length]; // Ensure it loops through the list of names

  return {
    "name": name,
    "image": "",
    "message": "Hi, terimakasih telah menghubungi kami..........",
    "time": timeString,
    "unread": index % 3,
  };
});

void main() {
  runApp(MaterialApp(
    home: ChatListPage(),
  ));
}
