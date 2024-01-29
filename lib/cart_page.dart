import 'package:flutter/material.dart';
import 'package:glocery_shop_app/model/cart_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Cart"),
        ),
        body: Consumer<cartModel>(
          builder: (context, value, child) {
            return value.cartItems.length == 0
                ? const Center(child: Text("Nothing in cart"))
                : Column(
                    children: [
                      Expanded(
                          child: ListView.builder(
                              itemCount: value.cartItems.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      subtitle: Text(
                                        "\$${value.cartItems[index][1].toString()}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      leading: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: const Color.fromRGBO(
                                                255, 241, 219, 1)),
                                        child: Image.asset(
                                            value.cartItems[index][2]),
                                      ),
                                      title: Text(
                                        value.cartItems[index][0],
                                        style: GoogleFonts.notoSerif(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      trailing: IconButton(
                                        onPressed: () {
                                          Provider.of<cartModel>(context,
                                                  listen: false)
                                              .removeElement(index);
                                        },
                                        icon: Icon(
                                          Icons.clear,
                                          color: Colors.green[300],
                                        ),
                                      ),
                                    ));
                              })),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(left: 60, right: 10),
                            child: Divider(
                              thickness: 2,
                            ),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Or',
                            style: TextStyle(
                                fontSize: 22, color: Colors.grey[700]),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(right: 60, left: 10),
                            child: Divider(
                              thickness: 2,
                            ),
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 40),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(118, 133, 218, 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Total Amount",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:
                                            Color.fromRGBO(201, 204, 240, 1)),
                                  ),
                                  Text(
                                    "\$${value.totalPrice()}",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          duration: Durations.extralong1,
                                          content: Text("Paid sucessfuly")));
                                },
                                child: const Text("PayNow"),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  );
          },
        ));
  }
}
