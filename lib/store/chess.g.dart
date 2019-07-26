// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chess.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$ChessStore on _ChessStore, Store {
  final _$boardSizeAtom = Atom(name: '_ChessStore.boardSize');

  @override
  int get boardSize {
    _$boardSizeAtom.context.enforceReadPolicy(_$boardSizeAtom);
    _$boardSizeAtom.reportObserved();
    return super.boardSize;
  }

  @override
  set boardSize(int value) {
    _$boardSizeAtom.context.conditionallyRunInAction(() {
      super.boardSize = value;
      _$boardSizeAtom.reportChanged();
    }, _$boardSizeAtom, name: '${_$boardSizeAtom.name}_set');
  }

  final _$boardsAtom = Atom(name: '_ChessStore.boards');

  @override
  List<List<String>> get boards {
    _$boardsAtom.context.enforceReadPolicy(_$boardsAtom);
    _$boardsAtom.reportObserved();
    return super.boards;
  }

  @override
  set boards(List<List<String>> value) {
    _$boardsAtom.context.conditionallyRunInAction(() {
      super.boards = value;
      _$boardsAtom.reportChanged();
    }, _$boardsAtom, name: '${_$boardsAtom.name}_set');
  }

  final _$draggedPieceAtom = Atom(name: '_ChessStore.draggedPiece');

  @override
  String get draggedPiece {
    _$draggedPieceAtom.context.enforceReadPolicy(_$draggedPieceAtom);
    _$draggedPieceAtom.reportObserved();
    return super.draggedPiece;
  }

  @override
  set draggedPiece(String value) {
    _$draggedPieceAtom.context.conditionallyRunInAction(() {
      super.draggedPiece = value;
      _$draggedPieceAtom.reportChanged();
    }, _$draggedPieceAtom, name: '${_$draggedPieceAtom.name}_set');
  }

  final _$originalPositionXAtom = Atom(name: '_ChessStore.originalPositionX');

  @override
  int get originalPositionX {
    _$originalPositionXAtom.context.enforceReadPolicy(_$originalPositionXAtom);
    _$originalPositionXAtom.reportObserved();
    return super.originalPositionX;
  }

  @override
  set originalPositionX(int value) {
    _$originalPositionXAtom.context.conditionallyRunInAction(() {
      super.originalPositionX = value;
      _$originalPositionXAtom.reportChanged();
    }, _$originalPositionXAtom, name: '${_$originalPositionXAtom.name}_set');
  }

  final _$originalPositionYAtom = Atom(name: '_ChessStore.originalPositionY');

  @override
  int get originalPositionY {
    _$originalPositionYAtom.context.enforceReadPolicy(_$originalPositionYAtom);
    _$originalPositionYAtom.reportObserved();
    return super.originalPositionY;
  }

  @override
  set originalPositionY(int value) {
    _$originalPositionYAtom.context.conditionallyRunInAction(() {
      super.originalPositionY = value;
      _$originalPositionYAtom.reportChanged();
    }, _$originalPositionYAtom, name: '${_$originalPositionYAtom.name}_set');
  }

  final _$_ChessStoreActionController = ActionController(name: '_ChessStore');

  @override
  dynamic setDraggedPiece(String piece, int positionX, int positionY) {
    final _$actionInfo = _$_ChessStoreActionController.startAction();
    try {
      return super.setDraggedPiece(piece, positionX, positionY);
    } finally {
      _$_ChessStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getImageBasedOnType(String type) {
    final _$actionInfo = _$_ChessStoreActionController.startAction();
    try {
      return super.getImageBasedOnType(type);
    } finally {
      _$_ChessStoreActionController.endAction(_$actionInfo);
    }
  }
}
