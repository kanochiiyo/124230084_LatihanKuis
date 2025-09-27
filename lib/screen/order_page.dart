import 'package:flutter/material.dart';
import 'package:latkuis/data/food_app_data.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key, required this.index});
  final int index;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int qty = 0;
  int total = 0;
  bool showTotal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8D6E63),
        foregroundColor: Colors.white,
        title: Text("Order Page"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset(
                foodList[widget.index].imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              Text(foodList[widget.index].name),
              Text(foodList[widget.index].description),
              Text("Rp ${foodList[widget.index].price}"),
              SizedBox(height: 20),
              _qtyField(),
              SizedBox(height: 20),
              _checkOutButton(),

              showTotal
                  ? Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Total: Rp $total",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _qtyField() {
    return Container(
      child: TextFormField(
        enabled: true, //biar bisa input
        onChanged: (value) {
          qty = int.parse(value) ?? 0;
        },
        decoration: InputDecoration(
          labelText: "Masukkan Jumlah",
          labelStyle: TextStyle(color: Color(0xFF8D6E63)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Color(0xFFA1887F)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Color(0xFF8D6E63), width: 2),
          ),
        ),
      ),
    );
  }

  Widget _checkOutButton() {
    return Container(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
          onPressed: () {
            setState(() {
              total = qty * foodList[widget.index].price;
              showTotal = true;
            });
          },
          child: Text("Pesan"),
        ),
      ),
    );
  }
}
