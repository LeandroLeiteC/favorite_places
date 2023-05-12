import 'package:flutter/material.dart';

void main() {
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TicTacToeScreen(),
    );
  }
}

class TicTacToeScreen extends StatefulWidget {
  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  List<List<String>> board = [];
  String currentPlayer = "";
  String winner = "";
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    startNewGame();
  }

  void startNewGame() {
    board = List<List<String>>.generate(3, (_) => List<String>.filled(3, ''));
    currentPlayer = 'X';
    winner = '';
    gameOver = false;
  }

  void makeMove(int row, int col) {
    if (!gameOver && board[row][col].isEmpty) {
      setState(() {
        board[row][col] = currentPlayer;
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        checkWinner();
      });
    }
  }

  void checkWinner() {
    // Check rows
    for (int i = 0; i < 3; i++) {
      if (board[i][0].isNotEmpty &&
          board[i][0] == board[i][1] &&
          board[i][0] == board[i][2]) {
        winner = board[i][0];
        gameOver = true;
        return;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (board[0][i].isNotEmpty &&
          board[0][i] == board[1][i] &&
          board[0][i] == board[2][i]) {
        winner = board[0][i];
        gameOver = true;
        return;
      }
    }

    // Check diagonals
    if (board[0][0].isNotEmpty &&
        board[0][0] == board[1][1] &&
        board[0][0] == board[2][2]) {
      winner = board[0][0];
      gameOver = true;
      return;
    }

    if (board[0][2].isNotEmpty &&
        board[0][2] == board[1][1] &&
        board[0][2] == board[2][0]) {
      winner = board[0][2];
      gameOver = true;
      return;
    }

    // Check for a draw
    bool isDraw = true;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j].isEmpty) {
          isDraw = false;
          break;
        }
      }
    }

    if (isDraw) {
      winner = 'Empate';
      gameOver = true;
    }
  }

  Widget buildCell(int row, int col) {
    return GestureDetector(
      onTap: () => makeMove(row, col),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        width: 100,
        height: 100,
        child: Center(
          child: Text(
            board[row][col],
            style: TextStyle(fontSize: 48),
          ),
        ),
      ),
    );
  }

  Widget buildBoard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < 3; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int j = 0; j < 3; j++) buildCell(i, j),
            ],
          ),
      ],
    );
  }

  Widget buildStatus() {
    if (gameOver) {
      if (winner.isNotEmpty) {
        return Text(
          'Vencedor: $winner',
          style: TextStyle(fontSize: 24),
        );
      } else {
        return Text(
          'Empate',
          style: TextStyle(fontSize: 24),
        );
      }
    } else {
      return Text(
        'Jogador Atual: $currentPlayer',
        style: TextStyle(fontSize: 24),
      );
    }
  }

  Widget buildButtonRestart() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          startNewGame();
        });
      },
      child: Text('Reiniciar'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildStatus(),
            SizedBox(height: 20),
            buildBoard(),
            SizedBox(height: 20),
            buildButtonRestart(),
          ],
        ),
      ),
    );
  }
}
