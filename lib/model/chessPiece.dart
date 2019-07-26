import 'package:flutter/material.dart';

enum PieceType {
  pawn,
  rook,
  knight,
  bishop,
  queen,
  king,
  none
}

class ChessPiece{
  PieceType type;
  Color pieceColor;
  int positionX;
  int positionY;
  String pieceName;

  ChessPiece(
      String pieceDetail,
      int positionX,
      int positionY
      ){
    this.pieceName = pieceDetail;
    this.positionX = positionX;
    this.positionY = positionY;
    switch(pieceDetail){
      case "BP":{
        this.type = PieceType.pawn;
        this.pieceColor = Colors.black;
        break;
      }
      case "BR":{
        this.type = PieceType.rook;
        this.pieceColor = Colors.black;
        break;
      }
      case "BH":{
        this.type = PieceType.knight;
        this.pieceColor = Colors.black;
        break;
      }
      case "BB":{
        this.type = PieceType.bishop;
        this.pieceColor = Colors.black;
        break;
      }
      case "BQ":{
        this.type = PieceType.queen;
        this.pieceColor = Colors.black;
        break;
      }
      case "BK":{
        this.type = PieceType.king;
        this.pieceColor = Colors.black;
        break;
      }
      case "WP":{
        this.type = PieceType.pawn;
        this.pieceColor = Colors.white;
        break;
      }
      case "WR":{
        this.type = PieceType.rook;
        this.pieceColor = Colors.white;
        break;
      }
      case "WH":{
        this.type = PieceType.knight;
        this.pieceColor = Colors.white;
        break;
      }
      case "WB":{
        this.type = PieceType.bishop;
        this.pieceColor = Colors.white;
        break;
      }
      case "WQ":{
        this.type = PieceType.queen;
        this.pieceColor = Colors.white;
        break;
      }
      case "WK":{
        this.type = PieceType.king;
        this.pieceColor = Colors.white;
        break;
      }
      default:{
        this.type = PieceType.none;
        this.pieceColor = Colors.red;
        break;
      }
    }
  }
}