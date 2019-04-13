set -e
# Run the analyzer to find any static analysis issues.
./flutter/bin/flutter analyze

# Run the formatter on all the dart files to make sure everything's linted.
find . -not -path "./flutter/*" | grep "\.dart$" | xargs ./flutter/bin/flutter format -n

# Run the actual tests.
./flutter/bin/flutter test
echo "-- Success --"