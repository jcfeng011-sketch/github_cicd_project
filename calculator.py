def add(a, b):
    """Add two numbers."""
    return a + b


def subtract(a, b):
    """Subtract two numbers."""
    return a - b


def multiply(a, b):
    """Multiply two numbers."""
    return a * b 


def divide(a, b):
    """Divide two numbers."""
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b

if __name__ == "__main__":
    print("Addition of 2 and 3 is: ", add(2, 3))
    print("Subtraction of 5 and 3 is: ", subtract(5, 3))
    print("Multiplication of 3 and 4 is: ", multiply(3, 4))
    print("Division of 10 and 2 is: ", divide(10, 2))