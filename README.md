# Flutter Guess My Number Game

Welcome to the Flutter Guess My Number game! This simple app challenges players to guess a randomly generated number between 1 and 100. With each guess, players receive feedback on whether the guessed number is too high, too low, or correct. When the correct number is guessed, a congratulatory dialog appears, revealing the number of attempts made.

## Table of Contents

- [Getting Started](#getting-started)
- [How to Play](#how-to-play)
- [Features](#features)
- [Code Structure](#code-structure)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

Follow these steps to get the Guess My Number game running on your local machine:

1. **Clone this repository:**

    ```bash
    git clone <Your Repository URL>
    cd guess_my_number_game
    ```

2. **Ensure you have Flutter installed:**

    If not, follow the instructions on the [official Flutter website](https://flutter.dev/docs/get-started/install).

3. **Fetch the dependencies:**

    ```bash
    flutter pub get
    ```

4. **Run the app:**

    ```bash
    flutter run
    ```

## How to Play

1. **Launch the app on your device or emulator.**
2. **The app will generate a random number between 1 and 100.**
3. **Enter your guess in the provided text field.**
4. **Press the "Guess" button to check if your guess is correct.**
5. **Receive feedback on whether your guess is too high, too low, or correct.**
6. **Continue guessing until you find the correct number.**

## Features

- Random number generation between 1 and 100.
- Input validation for the guess (numeric input).
- Feedback messages based on the comparison of the guessed number with the generated number.
- Congratulatory dialog when the correct number is guessed.
- Reset functionality to start a new game after guessing the correct number.

## Code Structure

- The main application is in the `main.dart` file.
- The game logic is implemented in the `GuessGame` class.
- State management is handled by the `setState` method.
- The UI is built using Flutter's widget system, including `Scaffold`, `AppBar`, `Column`, `Text`, `TextField`, and `ElevatedButton`.

## Contributing

Contributions are welcome! If you have suggestions for improvements, encounter issues, or want to add features, feel free to open issues or submit pull requests.

## License

This project is licensed under the [MIT License](LICENSE).
