#!/bin/bash

# Set default title and colors
TITLE="Verificación de Código - tests/test_app.py"
CODE_COLOR="#008000"  # Green
GUIDELINES_COLOR="#0000FF"  # Blue
TESTS_COLOR="#FF0000"  # Red
METRICS_COLOR="#FFA500"  # Orange
SECURITY_COLOR="#800080"  # Purple

# Get Python version
PYTHON_VERSION=$(python3 --version | awk '{print $2}')

# Extract test names from `tests/test_app.py`
TEST_NAMES=$(grep -oP '^test_\w+' tests/test_app.py)

# Run PyLint and capture output
PYLINT_OUTPUT=$(pylint tests/test_app.py)

# Extract PyLint score from output
PYLINT_SCORE=$(echo "$PYLINT_OUTPUT" | grep -oP "pylint score \((\d+\.\d+)\)")

# Compare PyLint score with threshold
if [[ "$PYLINT_SCORE" -lt 7.82 ]]; then
  PYLINT_STATUS="Incorrecto"
else
  PYLINT_STATUS="Correcto"
fi

# Generate Markdown output
echo "## $TITLE"

echo "### Formato del Código ####"
echo "<details><summary>Ver detalles</summary>"
echo "<pre style=\"color: $CODE_COLOR;\">No se ha implementado una función para verificar el formato del código.</pre>"
echo "</details>"

echo "### Cumplimiento de Guías y Estándares ####"
echo "<details><summary>Ver detalles</summary>"
echo "<pre style=\"color: $GUIDELINES_COLOR;\">$PYLINT_OUTPUT</pre>"
echo "</details>"
echo "Puntuación PyLint: $PYLINT_SCORE ($PYLINT_STATUS)"

echo "### Pruebas Automatizadas ####"
echo "<details><summary>Ver detalles</summary>"
echo "<pre style=\"color: $TESTS_COLOR;\">No se ha implementado una función para ejecutar pruebas automatizadas.</pre>"
echo "</details>"
echo "Pruebas pasadas: N/A"
echo "Pruebas fallidas: N/A"

echo "### Métricas del Código ####"
echo "<details><summary>Ver detalles</summary>"
echo "<pre style=\"color: $METRICS_COLOR;\">No se ha implementado una función para calcular las métricas del código.</pre>"
echo "</details>"

echo "### Análisis de Seguridad ####"
echo "<details><summary>Ver detalles</summary>"
echo "<pre style=\"color: $SECURITY_COLOR;\">No se ha implementado una función para realizar el análisis de seguridad.</pre>"
echo "</details>"

echo "#### Versiones de Herramientas ####"
echo "Python: $PYTHON_VERSION"
echo "PyLint: $(pylint --version | awk '{print $2}')"

echo "#### Resumen de Resultados ####"
echo "Código formateado correctamente: N/A"
echo "Cumplimiento de guías y estándares: $PYLINT_STATUS"
echo "Pruebas automatizadas pasadas: N/A"
echo "Pruebas automatizadas fallidas: N/A"
echo "Métricas de complejidad de McCabe: N/A"
echo "Análisis de seguridad completado: N/A"
