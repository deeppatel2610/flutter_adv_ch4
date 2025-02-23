import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adv_ch4/in%20app%20web/web_get_controller.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

int index = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Card(
                color: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      print(index);
                      getController.webViewController!.loadUrl(
                        urlRequest: URLRequest(
                          url: WebUri(
                            "${getController.linkList[index]}${getController.txtSearch.text}",
                          ),
                        ),
                      );
                    },
                    controller: getController.txtSearch,
                    decoration: const InputDecoration(
                      hintText: "🔍 Search or enter URL",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(
            "${getController.linkList[index]}${getController.txtSearch.text}",
          ),
        ),
        onWebViewCreated: (controller) {
          getController.webViewController = controller;
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: Colors.grey.shade200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              onPressed: () {
                getController.webViewController!.goBack();
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            IconButton(
              onPressed: () {
                getController.webViewController!.goForward();
              },
              icon: const Icon(Icons.arrow_forward_ios_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.star_rate_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.history_outlined),
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          child: boxMethod(
                            image: getController.imageList[0],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          child: boxMethod(
                            image: getController.imageList[1],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              index = 2;
                            });
                          },
                          child: boxMethod(
                            image: getController.imageList[2],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.menu_outlined),
            ),
          ],
        ),
      ),
    );
  }

  Container boxMethod({required String image}) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(image),
        ),
      ),
      child: const SizedBox(
        height: 60,
        width: 60,
      ),
    );
  }
}
