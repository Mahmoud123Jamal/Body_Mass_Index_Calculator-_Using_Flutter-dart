import 'package:flutter/material.dart';

class Result extends StatelessWidget {

 const Result({Key? key, 
required this.result, 
required this.age,
 required this.ismale}) :
  super(key: key);

 final double result;
 final int age;
 final bool ismale ;


String get resultPhrase{
  String resultPhrase='';
  if(result>= 30) {
    resultPhrase='obese';
  } else if(result> 25 && result <30 ) {
     resultPhrase='OverWight';
   } else if(result>= 18.5 && result<=24.9 ) {
     resultPhrase='Normal';
   } else {
     resultPhrase='Thin';
   }
 
  
  return resultPhrase;
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: const Text('The Result' ), centerTitle: true,
     ), 
     body: SafeArea(
      
      child: Center(
        
      child:Column(
        textDirection:TextDirection.ltr ,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
        Text('Gender : ${ismale?'Male':'Female'}',
         style:  Theme.of(context).textTheme.headline1,
        ),
        Text('Result : ${result.toStringAsFixed(1)}',
         style:  Theme.of(context).textTheme.headline1
        ),
         Text('Healthiness : $resultPhrase',
         style:  Theme.of(context).textTheme.headline1,
         textAlign: TextAlign.center,
        ),
        Text('Age : $age',
         style: Theme.of(context).textTheme.headline1
        )
       ],
      ) ,
      
      ),
     ),

    );
  }
}