
import 'package:api_test/http/http_helper.dart';
import 'package:api_test/models/login_user.dart';
import 'package:api_test/screen/profile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                FutureBuilder(
                    future: getData(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return Text("${snapshot.data!.firstName}");
                      }else if (snapshot.hasError){
                        return Center(child: Text("Error ...... "));
                      }else {
                        return Center(child: CircularProgressIndicator(),);
                      }
                    },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<LoginUser> getData() async {
    LoginUser loginUser = LoginUser.fromJson(await HttpHelper().loginUserFromApi());
    return loginUser;
  }
}

