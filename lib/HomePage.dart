import 'package:animated_progress_button/NextPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar
        (
        backgroundColor: Colors.cyan,
        title: Text("Animated Progress Button"),
        titleTextStyle: TextStyle(color: Colors.white),
        centerTitle: true,
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // The 1st button
          Container(
            height: 50,
            width: 200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder( // for use the squre shape in the button
                   borderRadius: BorderRadius.circular(0),
                ),
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                elevation: 10
              ),
                onPressed: ()async{
                setState(() {
                  isLoading = true;
                });
                await Future.delayed(Duration(seconds: 3),(){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NextPage()));// pushReplacement use korle flutter er by defult back option thake na
                });
                },

                child:isLoading?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                         CircularProgressIndicator(
                           strokeWidth: 4,
                           color: Colors.white,
                          ),
                        Spacer(),
                        Text("Please Wait...")
                     ],
                  )
                    : Text("Submitted")
            ),
          ),

          // The 1st button

        ],
        )
      )
    );
  }
}
