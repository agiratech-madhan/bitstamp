//   List<DataRow> getRows(List<User> users) => users.map((User user) {
//         final cells = [user.firstName, user.lastName, user.age];

//         return DataRow(cells: getCells(cells));
//       }).toList();

// }
import 'package:bitsnap/src/utils/utils.dart';
import 'package:flutter/material.dart';

class DataTableExample extends StatelessWidget {
  const DataTableExample({super.key});
  @override
  Widget build(BuildContext context) {
    var columns = ['BID PRICE', 'QTY', 'QTY', 'ASK PRICE'];

    return DataTable(
      horizontalMargin: 8,
      columnSpacing: 25,
      columns: getColumns(columns, context),
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('23769.00')),
            DataCell(Text('0.5788723')),
            DataCell(Text('0.5788723')),
            DataCell(Text('0.5788723')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('23769.00')),
            DataCell(Text('0.5788723')),
            DataCell(Text('0.5788723')),
            DataCell(Text('0.5788723')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('23769.00')),
            DataCell(Text('0.5788723')),
            DataCell(Text('0.5788723')),
            DataCell(Text('0.5788723')),
          ],
        ),
      ],
    );
  }

  List<DataColumn> getColumns(List<String> columns, BuildContext context) =>
      columns
          .map((String column) => DataColumn(
                label: Flexible(
                    child: Text(
                  column,
                  style: context.textThemes.titleSmall,
                )),
              ))
          .toList();
}
