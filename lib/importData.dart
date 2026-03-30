import 'package:flutter/material.dart';

class ImportDataFrom extends StatefulWidget {
  const ImportDataFrom({super.key});

  @override
  State<ImportDataFrom> createState() => _ImportDataFromState();
}

class _ImportDataFromState extends State<ImportDataFrom> {
  List arrayList = [];
//Ostad
  @override
  void initState() {
    super.initState();
    loadPopular();
  }
  void loadPopular() {
    arrayList = [];

    List jsonArray = [
      {
        "Image": "samsungA36.png",
        "title": "Samsung Galaxy A36 5G",
        "price": "42999",
      },
      {
        "Image": "samsungS26.png",
        "title": "Samsung Galaxy S26 Plus",
        "price": "152999",
      },
      {"Image": "sony.png", "title": "Sony Bravia", "price": "85320"},
      {"Image": "watch.png", "title": "COLMI P71 Smart Watch", "price": "1584"},
      {
        "Image": "watch2.png",
        "title": "COLMI P76 Smart Watch",
        "price": "1969",
      },
      {
        "Image": "drone.png",
        "title": "DK W7 GPS 4K Toy Drone Without RC",
        "price": "14080",
      },
      {"Image": "Shree.png", "title": "Shirt Collar Tunic", "price": "1199"},
      {"Image": "pant.png", "title": "Stretch Semi Fit Jeans", "price": "1500"},
      {
        "Image": "pant2.png",
        "title": "Semi Fit Twill Cargo Pant",
        "price": "1521",
      },
      {
        "Image": "facewash.png",
        "title": "Muuchstac Ocean Face Wash",
        "price": "850",
      },
    ];

    int size = jsonArray.length;

    for (int i = 0; i < size; i++) {
      var jsonObject = jsonArray[i];

      Map hashMap = {};
      hashMap["title"] = jsonObject["title"];
      hashMap["price"] = jsonObject["price"];
      hashMap["img"] = jsonObject["Image"];

      arrayList.add(hashMap);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data")),
      body: buildGrid(),
    );
  }

  Widget buildGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: arrayList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        var item = arrayList[index];

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "https://dhakashopping.xyz/CategoryList/popular/${item["img"]}",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["title"],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "৳ ${item["price"]}",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          Icon(Icons.favorite, weight: 10, color: Colors.red),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
