import 'package:flutter/material.dart';
import 'package:latkuis/auth/login_page.dart';
import 'package:latkuis/data/food_app_data.dart';
import 'package:latkuis/screen/detail_page.dart';

class HomePage extends StatelessWidget {
  final String user;
  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8D6E63),
        foregroundColor: Colors.white,
        title: Text("Halo @$user"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
                (route) => false,
              );
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/images/home_img.jpg",
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // menentukan aturan grid
                    crossAxisCount: 2, // ngefix jumlah kolom
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return _foodApp(context, index);
                  },
                  itemCount: foodList
                      .length, // menghitung berapa data yang ada di game list
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _foodApp(context, index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(index: index);
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 238, 209, 207),
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            ClipRRect(
              // borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(foodList[index].imageUrl[0]),
            ),
            Text(foodList[index].name),
            Text("Deskripsi: ${foodList[index].description}"),
            Text("Harga: ${foodList[index].price}"),
          ],
        ),
      ),
    );
  }
}
