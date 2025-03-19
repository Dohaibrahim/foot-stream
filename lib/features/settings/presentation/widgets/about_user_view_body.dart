import 'package:flutter/material.dart';
import 'package:foot_stream/core/utils/constants.dart';
import 'package:foot_stream/core/utils/shared_prefrences_helper.dart';

class AboutUserViewBody extends StatefulWidget {
  const AboutUserViewBody({
    super.key,
    required this.userName,
    required this.userEmail,
  });
  final String userName, userEmail;

  @override
  State<AboutUserViewBody> createState() => _AboutUserViewBodyState();
}

class _AboutUserViewBodyState extends State<AboutUserViewBody> {
  Future<Map<String, String?>> _getUserInfo() async {
    final username = await SharedPrefHelper.getStringNullable(
      SharedPrefKeys.userName,
    );
    final email = await SharedPrefHelper.getStringNullable(
      SharedPrefKeys.userEmail,
    );
    return {'username': username, 'email': email};
  }

  String _getInitials(String fullName) {
    List<String> names = fullName.split(" "); // Split the name into words
    if (names.length >= 2) {
      return "${names[0][0]}${names[1][0]}"
          .toUpperCase(); // First letter of first & last name
    } else {
      return names[0][0]
          .toUpperCase(); // If only one name, return the first letter
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: FutureBuilder<Map<String, String?>>(
        future: _getUserInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('حدث خطا ما حاول في وقت لاحق ${snapshot.error}'),
            );
          } else {
            final userInfo =
                snapshot.data ??
                {'username': 'User', 'email': 'user@example.com'};
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: screenHeight * 0.08),
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.blue[200],
                  child: Text(
                    //"AA",
                    style: TextStyle(fontSize: 25),
                    _getInitials(userInfo['username'] ?? "User"),
                    //userInfo['username']?.substring(0, 2).toUpperCase() ??"AA", // Use initials
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      " ${userInfo['username']}", // ${userName}",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      " ، مرحبا", // ${userName}",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  " الاسم", // ${userName}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),

                Text(
                  " ${userInfo['username']}", // ${userName}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.end,
                ),

                SizedBox(height: screenHeight * 0.05),
                Text(
                  "  البريد الالكتروني", // ${userName}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),

                Expanded(
                  child: Text(
                    " ${userInfo['email'] ?? ""}", // ${userName}",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
