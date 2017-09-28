import sys


def print_message(*args):
    print(args[0:])


if __name__ == '__main__':
    print_message(sys.argv)
