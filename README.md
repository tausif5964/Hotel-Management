# Hotel Management System

## Project Description

The Hotel Management System is a user-friendly application designed to manage hotel operations efficiently. Developed in Python with Tkinter for the graphical user interface and MySQL for database management, this system allows users to handle room reservations, customer check-ins and check-outs, and view reservation details.

## Key Features

- **Available Rooms Search**: Users can check room availability for specific dates.
- **Reservations Overview**: View and manage existing reservations.
- **Customer Check-In**: Register new customers and assign rooms.
- **Customer Check-Out**: Process customer check-outs and update room statuses.

## Prerequisites

- Python 3.x
- Tkinter (usually included with Python)
- MySQL Connector for Python

To install MySQL Connector for Python, use the following command:

```bash
pip install mysql-connector-python
```

## Installation and Setup

1. **Set Up the Database**

   Create the database and tables using the provided SQL commands. This step involves creating tables for customer information, room details, reservations, and payments, and inserting sample data.

2. **Run the Application**

   Ensure your MySQL server is running and the database schema is properly configured. Execute the Python script to launch the application.

## How to Use

- **Available Rooms Tab**: Enter check-in and check-out dates to find available rooms.
- **Reservations Tab**: View and refresh the list of reservations.
- **Check-In Tab**: Enter customer details and room information to check in a guest.
- **Check-Out Tab**: Provide the reservation ID to process check-outs and update room availability.

## Contributing

Contributions are welcome! To contribute, please fork the repository and submit a pull request. For major changes, discuss them through an issue first.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
