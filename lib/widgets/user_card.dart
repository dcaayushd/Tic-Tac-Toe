import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../configs/assets_path.dart';

class UserCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String coins;
  final String status;
  const UserCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.coins,
    this.status = '',
  });

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: w / 2.6,
          height: 140,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(height: 60),
              Text(
                widget.name,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    IconsPath.coinIcon,
                    width: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    '${widget.coins} Coins',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              widget.status == ''
                  ? SizedBox()
                  : widget.status == 'ready'
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.circle,
                              size: 20,
                              color: Colors.green,
                            ),
                            SizedBox(width: 10),
                            Text(widget.status),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              size: 20,
                              color: Colors.orange,
                            ),
                            SizedBox(width: 10),
                            Text(widget.status),
                          ],
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
