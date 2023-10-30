import 'package:flutter/material.dart';

class MenuBtn extends StatelessWidget {
  const MenuBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        // onTap: press,
        child: Container(
          margin: EdgeInsets.only(left:270 ),
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 3),
              blurRadius: 8,
              )
              ],
              ),
              child: IconButton(onPressed: (){
                
              }, 
              icon: Icon(Icons.menu),
              ),
        ),
      ),
    );
  }
}
