import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Guess my number 🤔',
      home: GuessGame(),
    );
  }
}

class GuessGame extends StatefulWidget {
  const GuessGame({super.key});

  @override
  _GuessGameState createState() => _GuessGameState();
}

class _GuessGameState extends State<GuessGame> {
  int numberToGuess = Random().nextInt(100) + 1;
  //initializam cu -1, o valoare care nu poate fi generata de Random().
  int userGuess = -1;
  int numberOfGuesses = 1;
  String message = '';
  bool gameOver = false;

  // Debugging method (we do a lil cheatin')
  /*void debugPrint() {
    print('numberToGuess: $numberToGuess');
    print('userGuess: $userGuess');
    print('numberOfGuesses: $numberOfGuesses');
    print('message: $message');
    print('gameOver: $gameOver');
  }*/

  // Show dialog "function"
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Congratulations! 🎉'),
          content: Text('You guessed right in $numberOfGuesses guesses.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Resetam jocul
                setState(() {
                  numberToGuess = Random().nextInt(100) + 1;
                  userGuess = -1;
                  numberOfGuesses = 1;
                  message = '';
                  gameOver = false;
                });
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //debugPrint();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Guess my number 🤔',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        //Setam culoarea de background a AppBar-ului
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'I am thinking of a number between 1 and 100.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),

            const Text(
              'Now try and guess it!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),

            //Facem o cutie in care sa punem TextField-ul si butonul
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple.withOpacity(0.1),
              ),
              child: Column(
                children: [
                  const Text(
                    'Try a number',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        userGuess = int.tryParse(value) ?? 0;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Enter your guess',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        //Game logic, verificam daca numarul introdus de user este egal cu numarul generat de Random()
                        if (userGuess == numberToGuess) {
                          message = 'You tried $userGuess. You guessed right! 🎉';
                          gameOver = true;
                          //chemam showDialog
                          _showDialog();
                        } else if (userGuess < numberToGuess) {
                          message = 'You tried $userGuess, try a higher number!';
                          numberOfGuesses++;
                        } else if (userGuess > numberToGuess) {
                          message = 'You tried $userGuess, try a lower number!';
                          numberOfGuesses++;
                        }
                      });
                    },
                    child: const Text('Guess'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            //Afisam mesajul in functie de numarul introdus de user
            Text(
              message,
              style: const TextStyle(
                color: Colors.purple,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
