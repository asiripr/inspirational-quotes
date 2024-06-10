import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Inspiring extends StatefulWidget {
  const Inspiring({super.key});

  @override
  State<Inspiring> createState() => _InspiringState();
}

class _InspiringState extends State<Inspiring> {
  final TextEditingController quoteController = TextEditingController();
  final TextEditingController autherController = TextEditingController();
  String receivedQuote = '';
  String receivedAuthor = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inspirational Quotes"), backgroundColor: Colors.green.shade200,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: quoteController,
              decoration: const InputDecoration(
                label: Text("Quote")
              ),
            ),
            const SizedBox(height: 30,),
            TextField(
              controller: autherController,
              decoration: const InputDecoration(
                label: Text("Author")
              ),
            ),
            const SizedBox(height: 30,),
            
            ElevatedButton(
              onPressed: (){
                CollectionReference collRef = FirebaseFirestore.instance.collection('quotes');
                collRef.add({
                  'quote': quoteController.text,
                  'author':autherController.text
                });
                quoteController.clear();
                autherController.clear();
              },
              child: Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5)
                ),
                child: const Center(child: Text("Save")),
              ),
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () async{
                CollectionReference collRef = FirebaseFirestore.instance.collection('quotes');
                QuerySnapshot querySnapshot = await collRef.get();
                if (querySnapshot.docs.isNotEmpty) {
                  var doc = querySnapshot.docs[0];
                  setState(() {
                    receivedQuote = doc['quote'];
                    receivedAuthor = doc['author'];
                    showCard();
                  });    
                }
              },
              child: Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5)
                ),
                child: const Center(child: Text("Recieve")),
              ),
            ),
            if(receivedQuote.isNotEmpty){
              
            }
          ],
        ),
      ),
    );
  }
  
  void showCard() {}
}