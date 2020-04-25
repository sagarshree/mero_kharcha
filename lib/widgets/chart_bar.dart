import 'package:flutter/material.dart';
import 'package:mero_kharcha/models/constants.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spentAmount;
  final double spentPct;

  ChartBar({
    this.label,
    this.spentAmount,
    this.spentPct,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          child: FittedBox(
            child: Text(
              '\$${spentAmount.toStringAsFixed(0)}',
              style: kChartTextStyle,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 120,
          width: 15,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: kChartBarBorderColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spentPct,
                child: Container(
                  decoration: BoxDecoration(
                    color: kChartBarColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          label,
          style: kChartTextStyle,
        ),
      ],
    );
  }
}
