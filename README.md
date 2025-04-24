# Anti-Cheating Rock Paper Scissors

An interactive Rock Paper Scissors game designed for the DES130 Prototyping Interactive Systems Course. This project implements a novel approach to prevent cheating in Rock Paper Scissors by using sensor-equipped gloves and simultaneous gesture detection.

## Overview

The system consists of three main components:
1. Player 1 Glove
2. Player 2 Glove
3. Visual Interface (Processing)

### Features

- **Anti-Cheating Mechanism**: Both players must make their gestures simultaneously when shaking their hands
- **Real-time Gesture Detection**: Uses MPU6050 accelerometer for accurate movement tracking
- **Wireless Communication**: RF-based communication between gloves and receiver
- **Visual Feedback**: 
  - Interactive countdown system
  - Dynamic gesture animations
  - Score tracking
  - Round management

## Hardware Requirements

- Arduino-compatible microcontrollers (x3)
- MPU6050 accelerometer modules (x2)
- RF transmitter/receiver modules
- Flex sensors (x8, 4 per glove)
- Vibration motors (x2)
- Glove material for construction

## Software Dependencies

### Arduino
- RH_ASK library (RF communication)
- Wire library (I2C communication)
- MPU6050_tockn library (Accelerometer control)

### Processing
- Required fonts:
  - 04B_30__.TTF
  - LIBRIUM_.ttf
  - TT.ttf

## Project Structure

```
├── README.md
├── frontend/                  # Processing visual interface
│   ├── INTEGRATED.pde
│   └── data/                 # Assets and resources
├── Glove_P1/                 # Player 1 glove firmware
│   └── Glove_P1.ino
├── Glove_P2/                 # Player 2 glove firmware
│   └── Glove_P2.ino
└── Receiver/                 # Central receiver firmware
    └── Receiver.ino
```

## How It Works

1. **Setup Phase**:
   - Players wear the sensor-equipped gloves
   - System initializes and establishes wireless connections

2. **Gameplay**:
   - Visual interface shows countdown
   - Players shake hands to trigger gesture recognition
   - Flex sensors detect finger positions to determine Rock/Paper/Scissors
   - Results are displayed instantly on screen
   - Scores are tracked automatically

3. **Anti-Cheating Features**:
   - Simultaneous gesture detection required
   - Vibration feedback confirms gesture registration
   - Wireless communication ensures synchronized gameplay

## Gesture Recognition

- **Rock**: Closed fist (all fingers closed)
- **Paper**: Open palm (all fingers extended)
- **Scissors**: Two fingers extended

Each gesture is detected using a combination of flex sensors on the fingers, ensuring accurate recognition of player moves.

## Score Tracking

The system automatically:
- Tracks individual player scores
- Manages game rounds
- Displays results after each round
- Shows running totals for the session

## Setup Instructions

1. Upload the respective firmware to each Arduino board:
   - `Glove_P1.ino` to Player 1's glove
   - `Glove_P2.ino` to Player 2's glove
   - `Receiver.ino` to the central receiver

2. Launch the Processing sketch (`INTEGRATED.pde`) for the visual interface

3. Ensure all wireless connections are established before starting gameplay

## Credits

Developed as part of the DES130 Prototyping Interactive Systems Course.
