"""
Construct the inline arguments for the helm install or upgrade command

@author: Prashanth Mohan <pmohan@ikigailabs.io>

Steps:
1. Reads input key_value yaml file
2. Constructs the inline values helm command section
"""
import sys
import yaml
from argparse import ArgumentParser

def main(key_value_filepath: str):
    # Get keys and values
    with open(key_value_filepath, "r") as f:
        ivalues: dict[str, str] = yaml.load(f, Loader=yaml.FullLoader)

    # Use keys and values to construct inline value command section
    inline_values=[f" --set {key}={value}\n" for key, value in ivalues.items()]

    print("".join(inline_values))
    return None

if __name__ == "__main__":
    # Get path of YAML file that stores keys and values
    parser = ArgumentParser()
    parser.add_argument("-f", "--key_value_filepath")
    args = parser.parse_args()

    sys.exit(main(key_value_filepath=args.key_value_filepath))