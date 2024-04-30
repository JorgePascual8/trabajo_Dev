#!/bin/bash

# Set the target directory (replace with your actual project directory)
TARGET_DIR="movies/scripts"

# Run the pipeline functions and capture their output
CODE_FORMAT_OUTPUT=$(python3 pipeline.py check_code_format)
GUIDELINES_OUTPUT=$(python3 pipeline.py check_guidelines_and_standards)
TESTS_OUTPUT=$(python3 pipeline.py run_tests)
METRICS_OUTPUT=$(python3 pipeline.py check_metrics)
SECURITY_OUTPUT=$(python3 pipeline.py check_security)

# Combine the output of each function into a single string
OUTPUT="$CODE_FORMAT_OUTPUT\n\n$GUIDELINES_OUTPUT\n\n$TESTS_OUTPUT\n\n$METRICS_OUTPUT\n\n$SECURITY_OUTPUT"

echo "Running check_code_format on: $TARGET_DIR/pipeline.py"
CODE_FORMAT_OUTPUT=$(python3 "$TARGET_DIR/pipeline.py" check_code_format)

# Print the combined output
echo -e "$OUTPUT"
