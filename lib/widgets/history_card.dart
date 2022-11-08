import 'package:flutter/material.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard({Key? key, required this.historyValue, required this.index})
      : super(key: key);

  final List<List<String>> historyValue;
  final int index;

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  var _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final Widget icon = _isExpanded
        ? const Icon(Icons.keyboard_arrow_up)
        : const Icon(Icons.keyboard_arrow_down);

    return Container(
      key: ValueKey(widget.historyValue[widget.index][0]),
      margin: const EdgeInsets.all(2),
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 3,
          vertical: 2,
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
                    widget.historyValue[widget.index][1],
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              widget.historyValue[widget.index][2],
              overflow: _isExpanded ? null : TextOverflow.ellipsis,
              textAlign: _isExpanded ? TextAlign.justify : TextAlign.start,
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
