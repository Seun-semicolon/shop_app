import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import './orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem orders;

  OrderItem(this.orders);

  @override
  _OrderItemState createState() => _OrderItemState();
}
class _OrderItemState extends State<OrderItem>{
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.orders.amount}'),
            subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.orders.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.orders.products.length * 20.00 + 10, 180),
            child: ListView(
              children: widget.orders.products.map(
                      (prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            prod.title,
                            style: TextStyle(fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('\$${prod.quantity}x \$${prod.price}',
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),

            )
                .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
