#!/bin/bash

# Set default title and colors
TITLE="Verificación de Código"
CODE_COLOR="#008000"  # Green
GUIDELINES_COLOR="#0000FF"  # Blue
TESTS_COLOR="#FF0000"  # Red
METRICS_COLOR="#FFA500"  # Orange
SECURITY_COLOR="#800080"  # Purple

# Get arguments
if [[ $# -eq 1 ]]; then
  TITLE="$1"
fi

# Get Python version
PYTHON_VERSION=$(python3 --version | awk '{print $2}')

# Run the pipeline functions and capture their output
CODE_FORMAT_OUTPUT=$(python3 pipeline.py check_code_format)
GUIDELINES_OUTPUT=$(python3 pipeline.py check_guidelines_and_standards)
TESTS_OUTPUT=$(python3 pipeline.py run_tests)
METRICS_OUTPUT=$(python3 pipeline.py check_metrics)
SECURITY_OUTPUT=$(python3 pipeline.py check_security)

# Extract test results from TESTS_OUTPUT
TEST_RESULTS=$(echo "$TESTS_OUTPUT" | grep -E "passed: \d+\.*failed: \d+")
PASSED_TESTS=$(echo "$TEST_RESULTS" | grep -oE "passed: \K\d+")
FAILED_TESTS=$(echo "$TEST_RESULTS" | grep -oE "failed: \K\d+")

# Extract PyLint score from GUIDELINES_OUTPUT
PYLINT_SCORE=$(echo "$GUIDELINES_OUTPUT" | grep -oP "pylint score \((\d+\.\d+)\)")

# Compare PyLint score with threshold
if (( $(echo "$PYLINT_SCORE < 7.82" | bc -l) )); then
    PYLINT_STATUS="Incorrecto"
else
    PYLINT_STATUS="Correcto"
fi

# Get tool versions
PYLINT_VERSION=$(pylint --version | awk '{print $2}')

# Generate Markdown output
echo "## $TITLE"

echo "### Formato del Código ####"
echo "<details><summary>Ver detalles</summary>"
echo "<pre style=\"color: $CODE_COLOR;\">$CODE_FORMAT_OUTPUT</pre>"
echo "</details>"

echo "### Cumplimiento de Guías y Estándares ####"
echo "<details><summary>Ver detalles</summary>"
echo "<pre style=\"color: $GUIDELINES_COLOR;\">$GUIDELINES_OUTPUT</pre>"
echo "</details>"
echo "Puntuación PyLint: $PYLINT_SCORE ($PYLINT_STATUS)"

echo "### Pruebas Automatizadas ####"
echo "<details><summary>Ver detalles</summary>"
echo "<pre style=\"color: $TESTS_COLOR;\">$TESTS_OUTPUT</pre>"
echo "</details>"
echo "Pruebas pasadas: $PASSED_TESTS"
echo "Pruebas fallidas: $FAILED_TESTS"

echo "### Métricas del Código ####"
echo "<details><summary>Ver detalles</summary>"
echo "<pre style=\"color: $METRICS_COLOR;\">$METRICS_OUTPUT</pre>"
echo "</details>"

echo "### Análisis de Seguridad ####"
echo "<details><summary>Ver detalles</summary>"
echo "<pre style=\"color: $SECURITY_COLOR;\">$SECURITY_OUTPUT</pre>"
echo "</details>"
