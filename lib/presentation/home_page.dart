import 'package:flutter/material.dart';
import 'package:nepaldometer/model/data_response.dart';
import '../constants.dart';
import 'widgets/data_tile.dart';
import 'package:nepaldometer/network/network_call.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataResponse? data;
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    data = await NetworkCall.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Nepaldometer'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/mohp.png'),
              Text(
                'Last 24 hour',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Row(
                children: [
                  DataTile(
                    text: 'Infected',
                    value: data != null ? data!.activeCases.toString() : '',
                    icon: Icons.coronavirus,
                    color: kRed,
                  ),
                  DataTile(
                    text: 'Recovered',
                    value: '12345',
                    icon: Icons.emoji_emotions,
                    color: kGreen,
                  ),
                ],
              ),
              DataTile(
                text: 'Death',
                value: '12345',
                icon: Icons.coronavirus,
                color: kOrange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
