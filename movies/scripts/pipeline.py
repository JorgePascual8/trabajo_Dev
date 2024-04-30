# Archivo: pipeline.py

import subprocess

def check_code_format():
    print("Verificando el formato del código...")
    try:
        subprocess.run(["black", "--check", "."], check=True, capture_output=True, text=True)
        print("El formato del código es adecuado.")
        return "El formato del código es adecuado."
    except subprocess.CalledProcessError:
        print("El código no cumple con el formato adecuado.")
        return "El código no cumple con el formato adecuado."

def check_guidelines_and_standards():
    print("Verificando cumplimiento de guías y estándares...")
    try:
        subprocess.run(["flake8"], check=True, capture_output=True, text=True)
        print("El código cumple con las guías y estándares establecidos.")
        return "El código cumple con las guías y estándares establecidos."
    except subprocess.CalledProcessError:
        print("El código no cumple con las guías y estándares establecidos.")
        return "El código no cumple con las guías y estándares establecidos."

def run_tests():
    print("Ejecutando pruebas automatizadas...")
    try:
        subprocess.run(["python", "-m", "pytest", "."], check=True, capture_output=True, text=True)
        print("Pruebas automatizadas pasadas exitosamente.")
        return "Pruebas automatizadas pasadas exitosamente."
    except subprocess.CalledProcessError:
        print("Alguna prueba automatizada ha fallado.")
        return "Alguna prueba automatizada ha fallado."

def check_metrics():
    print("Verificando métricas del código...")
    try:
        subprocess.run(["radon", "cc", "-a", "."], check=True, capture_output=True, text=True)
        print("Métricas de complejidad de McCabe verificadas.")
        return "Métricas de complejidad de McCabe verificadas."
    except subprocess.CalledProcessError:
        print("Error al verificar métricas de complejidad de McCabe.")
        return "Error al verificar métricas de complejidad de McCabe."

def check_security():
    print("Realizando análisis de seguridad...")
    try:
        subprocess.run(["bandit", "-r", "."], check=True, capture_output=True, text=True)
        print("Análisis de seguridad completado.")
        return "Análisis de seguridad completado."
    except subprocess.CalledProcessError:
        print("Error en el análisis de seguridad.")
        return "Error en el análisis de seguridad."

def main():
    output = ""
    output += check_code_format() + "\n\n"
    output += check_guidelines_and_standards() + "\n\n"
    output += run_tests() + "\n\n"
    output += check_metrics() + "\n\n"
    output += check_security() + "\n"
    return output

if __name__ == "__main__":
    print(main())
