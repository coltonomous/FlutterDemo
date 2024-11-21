import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  final List<String> rowLetters;
  final List<String> columnLetters;

  const GameBoard(this.rowLetters, this.columnLetters);

  @override
  Widget build(BuildContext context) {

    List<TableRow> tableData = [];
    for(int i = 0; i < rowLetters.length; i++){
      List<Text> cellData = [];

      for(int j = 0; j < columnLetters.length; j++){
        cellData.add(
          new Text(
            "${rowLetters[i]}.${columnLetters[j]}. / ${columnLetters[j]}.${rowLetters[i]}.",
            textAlign: TextAlign.center,
          )
        );
      }

      tableData.add(
        new TableRow(
          children: cellData,
        )
      );
    }

    return Table(
      border: TableBorder.all(),
      defaultColumnWidth: FlexColumnWidth(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: tableData,
    );
  }
}
