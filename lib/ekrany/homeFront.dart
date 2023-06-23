import 'package:flutter/material.dart';

class homeFront extends StatefulWidget {
  const homeFront({super.key});

  @override
  State<homeFront> createState() => _homeFrontState();
}

class _homeFrontState extends State<homeFront> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.amberAccent),
                  child: Text(
                    '',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {},
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.amber,
                  child: const Text('Test2'),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.amber,
                  child: const Text('Test3'),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.amber,
                  child: const Text('Test4'),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.amber,
                  child: const Text('Test5'),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.amber,
                  child: const Text('Test6'),
                ),
              ],
            )));
    //  return GridView.count(
    //    primary: false,
    //    padding: const EdgeInsets.all(20),
    //    crossAxisSpacing: 10,
    //    mainAxisSpacing: 10,
    //    crossAxisCount: 2,
    //    children: [
    //      Container(
    //        padding: const EdgeInsets.all(8),
    //        color: Colors.amber,
    //        child: const Text('Test1'),
    //      ),
    //      Container(
    //        padding: const EdgeInsets.all(8),
    //        color: Colors.amber,
    //        child: const Text('Test2'),
    //      ),
    //      Container(
    //        padding: const EdgeInsets.all(8),
    //        color: Colors.amber,
    //        child: const Text('Test3'),
    //      ),
    //      Container(
    //        padding: const EdgeInsets.all(8),
    //        color: Colors.amber,
    //        child: const Text('Test4'),
    //      ),
    //      Container(
    //        padding: const EdgeInsets.all(8),
    //        color: Colors.amber,
    //        child: const Text('Test5'),
    //      ),
    //      Container(
    //        padding: const EdgeInsets.all(8),
    //        color: Colors.amber,
    //        child: const Text('Test6'),
    //      ),
    //    ],
    //  );
  }
}
