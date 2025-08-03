Proceso Sistema_Control_De_Datos_Medicos_Control_Vital
    // Declaración de variables
    Definir nombre, clasificacion_imc, detalles_alerta, continuar Como Cadena;
    Definir edad, talla, peso, presion_sistolica, presion_diastolica, glucosa, temperatura, imc Como Real;
    Definir datos_normales Como Logico;
    Definir dia, mes, anio, dia_actual, mes_actual, anio_actual, categoria_imc Como Entero;
	
    Repetir
        Limpiar Pantalla;
        Escribir "=== SISTEMA DE CONTROL DE DATOS MÉDICOS BÁSICOS ===";
		
        // ======== NOMBRE Y FECHA =========
        Repetir
            Escribir "Ingrese el nombre completo del paciente:";
            Leer nombre;
        Hasta Que nombre <> "";
		
        Escribir "Ingrese el día de nacimiento (DD):";
        Leer dia;
        Escribir "Ingrese el mes de nacimiento (MM):";
        Leer mes;
        Escribir "Ingrese el año de nacimiento (AAAA):";
        Leer anio;
		
        Escribir "Ingrese el día actual (DD):";
        Leer dia_actual;
        Escribir "Ingrese el mes actual (MM):";
        Leer mes_actual;
        Escribir "Ingrese el año actual (AAAA):";
        Leer anio_actual;
		
        edad <- anio_actual - anio;
        Si (mes_actual < mes) O (mes_actual = mes Y dia_actual < dia) Entonces
            edad <- edad - 1;
        FinSi
		
        Si edad < 0 O edad > 120 Entonces
            Escribir "Edad no válida. Revise las fechas ingresadas.";
        FinSi
		
        // ======== INGRESO DE DATOS MÉDICOS =========
        Escribir "Ingrese la talla (m):"; Leer talla;
        Escribir "Ingrese el peso (kg):"; Leer peso;
        Escribir "Ingrese la presión sistólica (mmHg):"; Leer presion_sistolica;
        Escribir "Ingrese la presión diastólica (mmHg):"; Leer presion_diastolica;
        Escribir "Ingrese glucosa (mg/dL):"; Leer glucosa;
        Escribir "Ingrese temperatura (°C):"; Leer temperatura;
		
        // ======== CALCULAR IMC =========
        imc <- peso / (talla * talla);
		
        Si imc < 18.5 Entonces
            categoria_imc <- 1;
        Sino
            Si imc < 25 Entonces
                categoria_imc <- 2;
            Sino
                Si imc < 30 Entonces
                    categoria_imc <- 3;
                Sino
                    categoria_imc <- 4;
                FinSi
            FinSi
        FinSi
		
        // ======== CLASIFICAR IMC CON SEGUN =========
        Segun categoria_imc
            1:
                clasificacion_imc <- "Bajo peso";
            2:
                clasificacion_imc <- "Normal";
            3:
                clasificacion_imc <- "Sobrepeso";
            4:
                clasificacion_imc <- "Obesidad";
        FinSegun
		
        // ======== VALIDAR RANGOS =========
        datos_normales <- Verdadero;
        detalles_alerta <- "";
		
        Si No((presion_sistolica >= 90 Y presion_sistolica <= 120) Y (presion_diastolica >= 60 Y presion_diastolica <= 80)) Entonces
            detalles_alerta <- detalles_alerta + "- Presión arterial fuera de rango (90-120/60-80) ";
            datos_normales <- Falso;
        FinSi
		
        Si No(glucosa >= 70 Y glucosa <= 100) Entonces
            detalles_alerta <- detalles_alerta + "- Glucosa fuera de rango (70-100) ";
            datos_normales <- Falso;
        FinSi
		
        Si No(temperatura >= 36 Y temperatura <= 37.5) Entonces
            detalles_alerta <- detalles_alerta + "- Temperatura fuera de rango (36.0-37.5) ";
            datos_normales <- Falso;
        FinSi
		
        Si clasificacion_imc <> "Normal" Entonces
            detalles_alerta <- detalles_alerta + "- IMC fuera de rango (" + clasificacion_imc + ") ";
            datos_normales <- Falso;
        FinSi
		
        // ======== RESULTADOS =========
        Escribir "----------------------------------------";
        Escribir "Paciente: ", nombre;
        Escribir "Edad: ", edad, " años";
        Escribir "IMC: ", imc, " (", clasificacion_imc, ")";
        Escribir "Presión arterial: ", presion_sistolica, "/", presion_diastolica;
        Escribir "Glucosa: ", glucosa;
        Escribir "Temperatura: ", temperatura;
        Escribir "----------------------------------------";
		
        Si datos_normales Entonces
            Escribir "Todos los datos están en rango normal.";
        Sino
            Escribir "ALERTA: Datos fuera de rango:";
            Escribir detalles_alerta;
        FinSi
		
        Escribir "¿Desea registrar otro paciente? (si/no):";
        Leer continuar;
		
    Hasta Que continuar = "no";
	
    Escribir "Sistema finalizado. Gracias por utilizar el servicio.";
FinProceso

