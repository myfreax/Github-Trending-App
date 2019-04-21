set -e

# install dependencies
./flutter/bin/flutter packages get

#Serializing JSON using code generation libraries
#./flutter/bin/flutter packages pub run build_runner build


# Run the analyzer to find any static analysis issues.
./flutter/bin/flutter analyze --no-pub

# Run the formatter on all the dart files to make sure everything's linted.
find . -not -path "./flutter/*" | grep "\.dart$" | xargs ./flutter/bin/flutter format -n

# Run the actual tests.
./flutter/bin/flutter test
echo "-- Success --"