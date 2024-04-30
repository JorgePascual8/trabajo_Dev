#!/bin/bash

# Set the target directory (replace with your actual project directory)
TARGET_DIR="movies/scripts"

# Run the pipeline functions and capture their output
CODE_FORMAT_OUTPUT=$(python3 pipeline.py check_code_format)
GUIDELINES_OUTPUT=$(python3 pipeline.py check_guidelines_and_standards)
TESTS_OUTPUT=$(python3 pipeline.py run_tests)
METRICS_OUTPUT=$(python3 pipeline.py check_metrics)
SECURITY_OUTPUT=$(python3 pipeline.py check_security)

# Extract test results from TESTS_OUTPUT
TEST_RESULTS=$(echo "$TESTS_OUTPUT" | grep -E "passed: (\d+).*failed: (\d+)")
PASSED_TESTS=$(echo "$TEST_RESULTS" | grep -oP "passed: \K(\d+)")
FAILED_TESTS=$(echo "$TEST_RESULTS" | grep -oP "failed: \K(\d+)")

# Format and print the output
echo "### Verificación de Código ###"

echo "#### Formato del Código ####"
echo "$CODE_FORMAT_OUTPUT"

echo "#### Cumplimiento de Guías y Estándares ####"
echo "$GUIDELINES_OUTPUT"

echo "#### Pruebas Automatizadas ####"
echo "Pruebas pasadas: $PASSED_TESTS"
echo "Pruebas fallidas: $FAILED_TESTS"
echo "Detalles de las pruebas: $TESTS_OUTPUT"

echo "#### Métricas del Código ####"
echo "$METRICS_OUTPUT"

echo "#### Análisis de Seguridad ####"
echo "$SECURITY_OUTPUT"
