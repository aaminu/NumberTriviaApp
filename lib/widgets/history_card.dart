import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/numbers.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard(
      {Key? key, required this.id, required this.number, required this.text})
      : super(key: key);

  final String id;
  final String number;
  final String text;

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  var _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final Widget icon = _isExpanded
        ? const Icon(
            Icons.keyboard_arrow_up,
            color: Colors.red,
          )
        : const Icon(Icons.keyboard_arrow_down);

    return Dismissible(
      key: ValueKey(widget.id),
      background: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 3,
          vertical: 4,
        ),
        color: Theme.of(context).colorScheme.error,
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => Provider.of<Numbers>(context, listen: false)
          .deleteHistoryItem(widget.id),
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Are you sure"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                  },
                  child: const Text("Yes")),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: const Text("No"),
              )
            ],
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 3,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    widget.number,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              widget.text,
              overflow: _isExpanded ? null : TextOverflow.ellipsis,
              textAlign: _isExpanded ? TextAlign.center : TextAlign.start,
            ),
            trailing: IconButton(
              icon: icon,
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
