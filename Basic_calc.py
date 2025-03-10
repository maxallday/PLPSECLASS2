# Ask the user for two numbers and a mathematical operation
num1 = float(input("Enter the first number: "))
num2 = float(input("Enter the second number: "))
operation = input("Enter a mathematical operation (+, -, *, /): ")

# Perform the operation and print the result
if operation == "+":
    result = num1 + num2
    print(f"{num1} + {num2} = {result}")
elif operation == "-":
    result = num1 - num2
    print(f"{num1} - {num2} = {result}")
elif operation == "*":
    result = num1 * num2
    print(f"{num1} * {num2} = {result}")
elif operation == "/":
    if num2 != 0:
        result = num1 / num2
        print(f"{num1} / {num2} = {result}.round(0)")
    else:
        print("Division by zero is not allowed.")
else:
    print("Invalid operation. Please enter one of +, -, *, or /.")
