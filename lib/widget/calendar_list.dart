import 'package:flutter/material.dart';
import 'package:timeplifey/models/calendar.dart';

List<String> timeDifferenceInHours(String startTime, String endTime) {
  List<int> startComponents = startTime.split(':').map(int.parse).toList();
  List<int> endComponents = endTime.split(':').map(int.parse).toList();

  int startMinutes = startComponents[0] * 60 + startComponents[1];
  int endMinutes = endComponents[0] * 60 + endComponents[1];

  int differenceInMinutes = endMinutes - startMinutes;

  int hourDifference = differenceInMinutes ~/ 60;
  int minuteDifference = differenceInMinutes % 60;

  return [
    hourDifference == 0 ? "" : "${hourDifference}h",
    minuteDifference == 0 ? "" : " ${minuteDifference}m",
  ];
}

class CalendarList extends StatelessWidget {
  final List<Calendar> calendars;
  final Function(BuildContext, String) onRemoveCalendar;

  const CalendarList({
    super.key,
    required this.calendars,
    required this.onRemoveCalendar,
  });

  void _showDescription(
    BuildContext ctx,
    Calendar calendar,
  ) {
    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        final List<String> timeD =
            timeDifferenceInHours(calendar.start, calendar.end);
        return AlertDialog(
          insetPadding: const EdgeInsets.all(24),
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          title: Text(
            "${calendar.title} (${timeD[0]}${timeD[1]})",
            style: Theme.of(ctx).textTheme.bodyLarge,
          ),
          content: Text(calendar.description),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Pomodoro"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: calendars.length,
      itemBuilder: (context, index) {
        final item = calendars[index];
        return Dismissible(
          onDismissed: (_) {
            onRemoveCalendar(context, item.id);
          },
          direction: DismissDirection.endToStart,
          key: ValueKey(item.id),
          background: Container(
            alignment: AlignmentDirectional.centerEnd,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.red,
            ),
            child: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(
                Icons.delete_rounded,
                color: Colors.white,
              ),
            ),
          ),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onTap: () => _showDescription(
              context,
              item,
            ),
            title: Text(
              item.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Text(
              "${item.start} ~ ${item.end}",
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            subtitle: Text(
              item.description,
              style: const TextStyle(
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
