import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// import '../configs/assets_path.dart';

class InGameUserCard extends StatefulWidget {
  final String playIcon;

  const InGameUserCard({
    super.key,
    required this.playIcon,
  });

  @override
  State<InGameUserCard> createState() => _InGameUserCardState();
}

class _InGameUserCardState extends State<InGameUserCard> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: w / 2.6,
          height: 150,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(height: 60),
              Text(
                'Aayush Dc',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 30,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Column(
                  children: [
                    // SizedBox(height: 6),
                    // ! Issue Here
                    SvgPicture.asset(
                      widget.playIcon,
                      width: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -50,
          left: w / 2.6 / 2 - 50,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Theme.of(context).colorScheme.primaryContainer,
                width: 3,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
