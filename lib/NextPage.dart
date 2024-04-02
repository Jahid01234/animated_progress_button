import 'package:animated_progress_button/NextPage2.dart';
import 'package:flutter/material.dart';

enum ButtonState{init,loading,done} // Enum declare outside the classes

class NextPage extends StatefulWidget {
  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {


  ButtonState state = ButtonState.init;
  bool isAnimating = true;


  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final isDone = state == ButtonState.done;
    final isStrectched = isAnimating|| state == ButtonState.init;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Next Page"),
        centerTitle: true,
      ),

        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // The 1st button
               AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  height: 50,
                   //width: 200 ||state==ButtonState.init,
                    width: state==ButtonState.init? width:50,
                  // width: isStretched ? width : 200,
                   onEnd: (){
                    setState(() {
                      isAnimating = !isAnimating;
                    });
                  },
                  child:isStrectched? buildButton() : buildSmallButton(isDone)
                ),

                // The 1st button

              ],
            )
        )
    );
  }

  // Custom the buildButton Part
  Widget buildButton(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 150),
      child: ElevatedButton(

          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder( // for use the squre shape in the button
                borderRadius: BorderRadius.circular(0),
              ),
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              elevation: 10
          ),
         child: Text("Login"),
         onPressed: ()async{
            // the 1st setState
             setState(()=> state = ButtonState.loading);
              await Future.delayed(Duration(seconds: 3));


           // the 2nd setState
             setState(()=> state = ButtonState.done);
             await Future.delayed(Duration(seconds: 3));


             // the 3rd setState
             //setState(()=> state = ButtonState.init);
             if (state == ButtonState.done) {
               // Navigate to NextPage2 when the button is done
               Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage2()),
               );
             }
         },
          ),
    );
  }

  // Custom the buildSmallButton Part
  Widget buildSmallButton(bool isDone){

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isDone
             ? Colors.green
             : Colors.cyan
      ),
      child: Center(
          child: isDone
              ? Icon(Icons.done,size:50,color: Colors.white,)
              : CircularProgressIndicator(color: Colors.white)
      ),
    );
  }
}