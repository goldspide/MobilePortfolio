import 'package:flutter/material.dart';
import 'package:folio/acceuil.dart';

class FirstView extends StatefulWidget {
  const FirstView({super.key});

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Youpiiiiiii premier utilisation",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            const Text(":)",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            const SizedBox(height: 10,),
            Container(
              height: 40,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(50),
              ),
              child: InkWell( child: IconButton(onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const acceuil()));
              }, icon: const Icon(Icons.navigate_next))),
            )
          ],
        ),
      ),
    );
  }
}
