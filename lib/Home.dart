import 'Result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
bool ismale =true;
int age =21;
double  height=169;
int weight=62;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     
      appBar: AppBar(
       
        title: const Text('BMI Calculator'), centerTitle:true,
      ),
      body: SafeArea(
        child: Column(
          children:[   
     Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  ExpandedWidget(context , 'male'),
                  const SizedBox(width: 15,),
                  ExpandedWidget(context , 'female'),
                ],
              ),
            ),
          ),
  Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Height',
                          style: Theme.of(context).textTheme.headline2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.headline1),
                          Text('CM',
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                      Slider(
                        min: 90,
                        max: 205,
                        value:height,
                        onChanged: (newValue) => setState(() => height = newValue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          
           Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  ExpandedWidget2(context , 'weight'),
                  const SizedBox(width: 15,),
                  ExpandedWidget2(context , 'age'),
                ],
              ),
            ),
          ),
          
          
          
          
          
          Container(
            width:double.infinity,
            height: MediaQuery.of(context).size.height/20,
            color: Colors.teal,
            child: TextButton(
              onPressed: (){
             
                var result = weight/pow(2, height/100);
                Navigator.push(context , MaterialPageRoute(builder: (BuildContext context) { 
             return Result(result: result, age: age, ismale: ismale);
               
                 }));
              }, 
              child: Text('Calculate'
              ,style:  Theme.of(context).textTheme.headline2
              ),
              
              ),
              
            
            ),
          
        ]),
      ),
      
    );
  }

  Expanded ExpandedWidget(BuildContext context , String type) {
    return Expanded(
          child: GestureDetector(
            onTap: (){
              setState(() {
                ismale=(type=='male')? true:false;
              });
            },
            child: Container(
             decoration: BoxDecoration(
            color: ismale&&type=='male'||!ismale&&type=='female'? Colors.grey : Colors.blueGrey,
            borderRadius: BorderRadius.circular(10)
             ) ,
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children:  <Widget>[
                  Icon(type=='male'?Icons.male :Icons.female ,size: 90,),
                 const SizedBox(
                  height: 15,
                 ),
                  Text(
                   type=='male'?  'Male':'female',
                    style:Theme.of(context).textTheme.headline2,
                  ),
                  
                ],
              ),
            ),
          ),
        );
  }
  
  ExpandedWidget2(BuildContext context, String type) {

     return Expanded(
          child: Container(
           decoration: BoxDecoration(
          color:  const Color.fromARGB(255, 70, 98, 121),
          borderRadius: BorderRadius.circular(10)
           ) ,
            child: Column(
              children:  <Widget>[
                const SizedBox(
                height: 5,
               ),
               Text(
                 type=='weight'?  'Weight':'Age',
                  style:Theme.of(context).textTheme.headline2,
                ),
               const SizedBox(
                height: 5,
               ),
                Text(
                 type=='weight'?  '$weight':'$age',
                  style:Theme.of(context).textTheme.headline1,
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
              FloatingActionButton(
                    heroTag: type=='weight'?'weight--':'age--',
                    onPressed: (){
                      setState(() {
                      type=='weight'? weight-- : age--;
                      });
                    },
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.deepOrange,
                  mini: true,
                   
                  child: const Icon(Icons.remove ,
                  color: Colors.white),
                  ),
                   const SizedBox(width: 20,),
                   FloatingActionButton(
                    heroTag: type=='weight'?'weight++':'age++',
                    onPressed: (){
                      setState(() {
                      type=='weight'? weight++ : age++;
                      });
                    },
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.deepOrange,
                 mini: true,
                   
                  child: const Icon(Icons.add ,
                  color: Color.fromARGB(255, 189, 155, 155)),
                  )
                ],)
              ],
            ),
          ),
        );
  }
}