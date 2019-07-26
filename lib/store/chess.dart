import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess/model/chessDetail.dart';
import 'package:flutter_chess/model/chessPiece.dart';
import 'dart:math';

// This is our generated file (we'll see this soon!)
part 'chess.g.dart';

// We expose this to be used throughout our project
class ChessStore = _ChessStore with _$ChessStore;

// Our store class
abstract class _ChessStore with Store {
  @observable
  int boardSize = 8;

  @observable
  int turn = 0;

  @observable
  List<List<String>> boards = [
    [ "BR", "BH", "BB", "BQ", "BK", "BB", "BH", "BR" ],
    [ "BP", "BP", "BP", "BP", "BP", "BP", "BP", "BP" ],
    [ "", "", "", "", "", "", "", ""],
    [ "", "", "", "", "", "", "", ""],
    [ "", "", "", "", "", "", "", ""],
    [ "", "", "", "", "", "", "", ""],
    [ "WP", "WP", "WP", "WP", "WP", "WP", "WP", "WP" ],
    [ "WR", "WH", "WB", "WK", "WQ", "WB", "WH", "WR" ],
  ];

  @action
  init(){
    this.turn = 0;
    this.boards = [
      [ "BR", "BH", "BB", "BQ", "BK", "BB", "BH", "BR" ],
      [ "BP", "BP", "BP", "BP", "BP", "BP", "BP", "BP" ],
      [ "", "", "", "", "", "", "", ""],
      [ "", "", "", "", "", "", "", ""],
      [ "", "", "", "", "", "", "", ""],
      [ "", "", "", "", "", "", "", ""],
      [ "WP", "WP", "WP", "WP", "WP", "WP", "WP", "WP" ],
      [ "WR", "WH", "WB", "WK", "WQ", "WB", "WH", "WR" ],
    ];
  }

  @observable
  String draggedPiece = "";

  @observable
  int originalPositionX = 0;

  @observable
  int originalPositionY = 0;

  @observable
  int destX = 0;
  @observable
  int destY = 0;

  @action
  setDestX(x){
    destX = x;
  }

  @action
  setDestY(y){
    destY = y;
  }

  @action
  setDraggedPiece(String piece, int positionX, int positionY){
    draggedPiece = piece;
    originalPositionX = positionX;
    originalPositionY = positionY;
  }

  move(ChessPiece chessPiece){
      boards[chessPiece.positionX][chessPiece.positionY] = "";
      boards[destX][destY] = chessPiece.pieceName;
      this.turn = chessPiece.pieceColor == Colors.white ? 1 : 0;
  }

  canMove(ChessPiece pieceDetail, int destX, int destY){
      print("Move: ${pieceDetail.pieceName}");
      print("From: ${pieceDetail.positionX}, ${pieceDetail.positionY}");
      print("To: $destX, $destY");
      if(turn == 0 && pieceDetail.pieceColor == Colors.black){
        return false;
      }
      else if(turn == 1 && pieceDetail.pieceColor == Colors.white){
        return false;
      }
      switch(pieceDetail.pieceName){
        case "WP":
        case "BP":
          {
            return isPawnMoveValid(pieceDetail, pieceDetail.positionX, pieceDetail.positionY, destX, destY);
          }
        case "WR":
        case "BR":
          {
            return isRookMoveValid(pieceDetail, pieceDetail.positionX, pieceDetail.positionY, destX, destY);
          }
        case "WH":
        case "BH":
          {
            return isKnightMoveValid(pieceDetail, pieceDetail.positionX, pieceDetail.positionY, destX, destY);
          }
        case "WB":
        case "BB":
          {
            return isBishopMoveValid(pieceDetail, pieceDetail.positionX, pieceDetail.positionY, destX, destY);
          }
        case "WQ":
        case "BQ":
          {
            return isQueenMoveValid(pieceDetail, pieceDetail.positionX, pieceDetail.positionY, destX, destY);
          }
        case "WK":
        case "WK":
          {
            return isKingMoveValid(pieceDetail, pieceDetail.positionX, pieceDetail.positionY, destX, destY);
          }
        default:
          {
            return false;
          }
      }
  }

  @action
  getImageBasedOnType(String type){
    switch(type){
      case "WP":
        {
          return "images/white_pawn.png";
        }
      case "WR":
        {
          return "images/white_rook.png";
        }
      case "WH":
        {
          return "images/white_knight.png";
        }
      case "WB":
        {
          return "images/white_bishop.png";
        }
      case "WQ":
        {
          return "images/white_queen.png";
        }
      case "WK":
        {
          return "images/white_king.png";
        }
      case "BP":
        {
          return "images/black_pawn.png";
        }
      case "BR":
        {
          return "images/black_rook.png";
        }
      case "BH":
        {
          return "images/black_knight.png";
        }
      case "BB":
        {
          return "images/black_bishop.png";
        }
      case "BQ":
        {
          return "images/black_queen.png";
        }
      case "BK":
        {
          return "images/black_king.png";
        }
      default:
        {
          return "";
        }
    }
  }

  bool isPawnMoveValid(ChessPiece pawn, int originX, int originY, int destX, int destY){
    if(pawn.pieceColor == Colors.white){
      if(destX > originX){
        return false;
      }

      if(originY == destY){
        if(originX == 6){
          if((originX - destX).abs() == 1 ){
            return boards[originX - 1][destY] == "";
          }
          else if((originX - destX).abs() == 2){
            return boards[originX - 2][destY] == "";
          }
        }
        else{
          return (originX - destX).abs() == 1 && boards[originX - 1][destY] == "";
        }
      }
      else if( (originY - destY).abs() == 1 &&  (originX - destX).abs() == 1){
        var destTale = new ChessPiece(boards[destX][destY], destX, destY);
        return destTale.pieceColor == Colors.black;
      }
    }
    else{
      if(destX < originX){
        return false;
      }

      if(originY == destY){
        if(originX == 1){
          if((originX - destX).abs() == 1 ){
            return boards[originX + 1][destY] == "";
          }
          else if((originX - destX).abs() == 2){
            return boards[originX + 2][destY] == "";
          }
        }
        else{
          return (originX - destX).abs() == 1 && boards[originX + 1][destY] == "";
        }
      }
      else if( (originY - destY).abs() == 1 &&  (originX - destX).abs() == 1){
        var destTale = new ChessPiece(boards[destX][destY], destX, destY);
        return destTale.pieceColor == Colors.white;
      }
    }

    return false;
  }

  bool isRookMoveValid(ChessPiece rook, int originX, int originY, int destX, int destY){
    if(originX != destX && originY != destY){
        return false;
    }

    if(boards[destX][destY] == ""){
      if(originX == destX){
        if(originY > destY){
          for(var i = originY - 1; i >= destY; i--){
            if(boards[originX][i] != ""){
              return false;
            }
          }
        }
        else{
          for(var i = originY + 1; i <= destY; i++){
            if(boards[originX][i] != ""){
              return false;
            }
          }
        }
      }
      else if(originY == destY){
        if(originX > destX){
          for(var i = originX - 1; i >= destX; i--){
            if(boards[i][originY] != ""){
              return false;
            }
          }
        }
        else{
          for(var i = originX + 1; i <= destX; i++){
            if(boards[i][originY] != ""){
              return false;
            }
          }
        }
      }
    }
    else{

    }
    return false;
  }

  isKnightMoveValid(ChessPiece knight, int originX, int originY, int destX, int destY){
    return true;
  }

  isBishopMoveValid(ChessPiece bishop, int originX, int originY, int destX, int destY){
    return true;
  }

  isQueenMoveValid(ChessPiece queen, int originX, int originY, int destX, int destY){
    return true;
  }

  isKingMoveValid(ChessPiece king, int originX, int originY, int destX, int destY){
    return (king.positionX == destX && (king.positionY - destY).abs() == 1) ||
        (king.positionY == destY && (king.positionX - destX).abs() == 1) ||
        ((king.positionY - destY).abs() == 1 && (king.positionX - destX).abs() == 1);
  }
}