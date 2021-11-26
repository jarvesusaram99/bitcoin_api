import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
// import 'package:login_app/pages/Widgets/data.dart';
import '../My_Drawer.dart';

Future<List<Post>> fetchPosts() async {
  http.Response response = await http.get(Uri.parse(
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"));
  var responseJson = json.decode(response.body);
  return 
  (responseJson as List).map((p) => Post.fromJson(p)).toList();
}

class Post {
  // ignore: non_constant_identifier_names
  final String name, image, symbol, current_price, market_cap_rank, updateDate;

  Post({                                            
    required this.name,
    required this.image,
    required this.symbol,
    // ignore: non_constant_identifier_names
    required this.current_price,
    // ignore: non_constant_identifier_names
    required this.market_cap_rank,
    required this.updateDate,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      name: json['name'].toString(),
      image: json['image'].toString(),
      symbol: json['symbol'].toString(),
      current_price: json['current_price'].toString(),
      market_cap_rank: json['market_cap_rank'].toString(),
      updateDate: json['utcTime'].toString(),
    );
  }
}

class NewsApp extends StatefulWidget {
  NewsApp({Key? key}) : super(key: key);

  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  var listSource;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    super.initState();
    fetchPosts();
    refreshListSource();
  }

  Future<Null> refreshListSource() async {
    refreshKey.currentState?.show(atTop: false);
    setState(() {
      listSource = fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: new AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Cryptocurrency',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 19.0)),
        ),
        drawer: MyDrawer(),
        body: RefreshIndicator(
          onRefresh: refreshListSource,
          child: Container(
            child: new ListView(
              children: <Widget>[
                FutureBuilder<List<Post>>(
                  future: fetchPosts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Post>? posts = snapshot.data;
                      return new Column(
                          children: posts!
                              .map((post) => new Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(14),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24.0, vertical: 24),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(19),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.white,
                                                  blurRadius: 1,
                                                  offset: Offset(3, 4)),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              CircleAvatar(
                                                radius: 25.0,
                                                backgroundColor:
                                                    Colors.transparent,
                                                backgroundImage:
                                                    NetworkImage(post.image),
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text(post.name,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5),
                                                    Text('Current Price: \$' +
                                                        post.current_price)
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ))
                              .toList());
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return new Center(
                      child: new Column(
                        children: <Widget>[
                          new Padding(padding: new EdgeInsets.all(50.0)),
                          new CircularProgressIndicator.adaptive(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        )
        );
  }
}