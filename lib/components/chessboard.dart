import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_chess/store/chess.dart';

import 'package:flutter_chess/model/chessPiece.dart';

class ChessBoard extends StatefulWidget {
  @override
  _ChessBoardState createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  final ChessStore chessStore = ChessStore();

  _ChessBoardState(){
    chessStore.init();
  }

  Widget renderRows(int column){
    List<Widget> rows = new List<Widget>();
    for(int i = 0; i < chessStore.boardSize; i++){
      String imageAsset = chessStore.getImageBasedOnType(chessStore.boards[column][i]);
      Widget dragTarget = new DragTarget(
        builder: (context, List<ChessPiece> candidateData, rejectedData){
          return Center(
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: column % 2 == 0 ?
                i % 2 == 0 ? Colors.white : Colors.blueGrey :
                i % 2 == 0 ? Colors.blueGrey : Colors.white,
                border: new Border.all(
                    color: Colors.black,
                    width: 1
                ),
              ),
              child: Center(
                child: imageAsset.length > 0 ?
                Draggable(
                  child: Observer(
                      builder: (_) => Image.asset(chessStore.getImageBasedOnType(chessStore.boards[column][i]))
                  ),
                  feedback: Image.asset(imageAsset),
                  childWhenDragging: Container(),
                  data: new ChessPiece(chessStore.boards[column][i], column, i),
                  onDragStarted: (){
                    chessStore.setDraggedPiece(chessStore.boards[column][i], i, column);
                  },
                  onDragCompleted: (){
                    chessStore.move(new ChessPiece(chessStore.boards[column][i], column, i));
                    setState(() {

                    });
                  },
                )
                    : Container(),
              ),
            ),
          );
        },
        onWillAccept: (data){
          var result = chessStore.canMove(data, column, i);
          print("Move Accepted: $result");
          return result;
        },
        onAccept: (data){
          chessStore.setDestX(column);
          chessStore.setDestY(i);
        },
      );
      rows.add(dragTarget);
    }
    return new Row(
      children: rows,
    );
  }

  Widget renderColumns(){
    List<Widget> columns = new List<Widget>();
    for(int j = 0;j < chessStore.boardSize; j++){
      columns.add( renderRows(j) );
    }
    return new Column(
      children: columns,
    );
  }

  @override
  Widget build(BuildContext context){
    return Container(
        child: renderColumns()
    );
  }
}