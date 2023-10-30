import 'package:flutter/material.dart';

import 'login.dart';

// ignore: camel_case_types
class acceuil extends StatefulWidget {
  const acceuil({super.key});

  @override
  State<acceuil> createState() => _acceuilState();
}

// ignore: camel_case_types
class _acceuilState extends State<acceuil> {

late PageController _pageController;
int pageIndex = 0;

    @override
    void initState(){
      _pageController = PageController(initialPage: 0);
      super.initState();
    }

    @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 241),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: donnee.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  itemBuilder: (context,index)=>bascule(
                  image: donnee[index].image,
                  title: donnee[index].title,
                  description: donnee[index].description,
                ),),
              ),
              Row(
                children: [
                  ...List.generate(donnee.length, (index) => Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: indication(isActive: index == pageIndex),
                  ),),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 90,

                    //bouton next
                    child: ElevatedButton(
                      onPressed: (){ 
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const authentification(), //ouverture de la next page
                        ),);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                       child: Image.asset("images/sonnet.png", color: Color.fromARGB(255, 18, 11, 11),width: 27,),
                      // child: Text("Next"),
                      ),
                  ),
                ],
              )
            ],
          ),
        )
        ),
      );
  }
}

// ignore: camel_case_types
class indication extends StatelessWidget {
  const indication({
    super.key, 
    this.isActive = false,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color:isActive ? Colors.lightBlue: Colors.black45,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
      
    );
  }
}

// ignore: camel_case_types
class vrap{
  final String image, title, description;

  vrap({
 required this.image, 
 required this.title, 
 required this.description
 });
}

final List<vrap> donnee =[
  vrap(
      image: "images/i1.png",
      title: "Bienvenue sur Afri~Cash",
      description: "Votre App de Gestion de portefeuilles \n Your porfolio management App",
  ),
  vrap(
      image: "images/partena.png",
      title: "Le partenair ideal pour l'investissement",
      description: "Nous vous proposons des opportunites en or de vous faire de l'argent tout en restant chez vous !",
  ),
  vrap(
      image: "images/recharge.png",
      title: "Mode de Recharge",
      description: "Il est possible de faire des recharges avec une grande simplicite, grace aux outils telque: \n\n Orange Money  \n MTN Money \n Carte Bancaire",
  ),
  vrap(
      image: "images/stat.png",
      title: "Projection sur les actions",
      description: "Avec nous vous auraient toujour un cout d'avance sur les bources",
  ),
];

// ignore: camel_case_types
class bascule extends StatelessWidget {
  const bascule({
    super.key, 
    required this.image, 
    required this.title, 
    required this.description,
  });
  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(image,height: 150,), 
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center, 
          style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height:16),
         Text(
          description,
          textAlign: TextAlign.center,

        ),
        const Spacer(),
      ],
    );
  }
}
// https://www.youtube.com/watch?v=Hq7Wj6DshNs0