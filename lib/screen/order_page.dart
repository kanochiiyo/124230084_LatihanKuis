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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 8,
          shadowColor: Colors.brown.shade200,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    foodList[widget.index].imageUrl,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  foodList[widget.index].name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[800],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  foodList[widget.index].description,
                  style: TextStyle(fontSize: 16, color: Colors.brown[600]),
                ),
                SizedBox(height: 8),
                Text(
                  "Rp ${foodList[widget.index].price}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[900],
                  ),
                ),
                SizedBox(height: 16),
                _qtyField(),
                SizedBox(height: 16),
                _checkOutButton(),
                if (showTotal)
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.brown.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Total: Rp $total",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.brown[800],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
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
