SubProceso CargarDatosIniciales(productos Por Referencia, claves Por Referencia, precios Por Referencia, inventario Por Referencia, n)
    productos[1] <- "Leche"
    productos[2] <- "Pan"
    productos[3] <- "Cafe"
    productos[4] <- "Azucar"
    productos[5] <- "Arroz"
    
    claves[1] <- "P001"
    claves[2] <- "P002"
    claves[3] <- "P003"
    claves[4] <- "P004"
    claves[5] <- "P005"
    
    precios[1] <- 25.50
    precios[2] <- 18.00
    precios[3] <- 80.75
    precios[4] <- 22.30
    precios[5] <- 35.40
    
    inventario[1] <- 20
    inventario[2] <- 30
    inventario[3] <- 15
    inventario[4] <- 25
    inventario[5] <- 18
FinSubProceso

// Funci?n para mostrar el men? principal
SubProceso MostrarMenu
    Escribir "======= SISTEMA DE GESTIoN DE TIENDA ======="
    Escribir "1. Consultar precio de un producto"
    Escribir "2. Realizar una venta"
    Escribir "3. Hacer corte de caja"
    Escribir "4. Agregar nuevo producto"
    Escribir "5. Actualizar inventario"
    Escribir "6. Mostrar cat?logo completo"
    Escribir "7. Buscar producto"
    Escribir "8. Salir"
    Escribir "============================================="
    Escribir "Seleccione una opci?n: "
FinSubProceso

// Funci?n para consultar el precio de un producto
SubProceso ConsultarPrecio(productos, claves, precios, n)
    Definir clave Como Cadena
    Definir encontrado Como Logico
    Definir i Como Entero
    
    Escribir "Ingrese la clave del producto: "
    Leer clave
    
    encontrado <- Falso
    Para i <- 0 Hasta n-1 Hacer
        Si claves[i] = clave Entonces
            Escribir "Producto: ", productos[i]
            Escribir "Precio: $", precios[i]
            encontrado <- Verdadero
        FinSi
    FinPara
    
    Si NO encontrado Entonces
        Escribir "Producto no encontrado. Verifique la clave."
    FinSi
FinSubProceso

// Funci?n para realizar una venta
SubProceso RealizarVenta(productos, claves, precios, inventario Por Referencia, n, caja Por Referencia, ventasRealizadas Por Referencia)
    Definir clave Como Cadena
    Definir cantidad Como Entero
    Definir pago Como Real
    Definir total Como Real
    Definir cambio Como Real
    Definir i, indice Como Entero
    Definir encontrado Como Logico
    
    Escribir "---- NUEVA VENTA ----"
    Escribir "Ingrese la clave del producto: "
    Leer clave
    
    encontrado <- Falso
    indice <- 0
    Para i <- 0 Hasta n-1 Hacer
        Si claves[i] = clave Entonces
            indice <- i
            encontrado <- Verdadero
        FinSi
    FinPara
    
    Si NO encontrado Entonces
        Escribir "Producto no encontrado. Verifique la clave."
    Sino
        Escribir "Producto: ", productos[indice], " - Precio: $", precios[indice]
        Escribir "Inventario disponible: ", inventario[indice]
        Escribir "Ingrese la cantidad a vender: "
        Leer cantidad
        
        Si cantidad <= 0 Entonces
            Escribir "La cantidad debe ser mayor a cero."
        Sino
            Si cantidad > inventario[indice] Entonces
                Escribir "Inventario insuficiente. Solo hay ", inventario[indice], " unidades disponibles."
            Sino
                total <- precios[indice] * cantidad
                Escribir "Total a pagar: $", total
                
                Escribir "Ingrese el monto con el que paga el cliente: $"
                Leer pago
                
                Si pago < total Entonces
                    Escribir "El pago es insuficiente."
                Sino
                    cambio <- pago - total
                    inventario[indice] <- inventario[indice] - cantidad
                    caja <- caja + total
                    ventasRealizadas <- ventasRealizadas + 1
                    
                    Escribir "----- TICKET DE VENTA -----"
                    Escribir "Producto: ", productos[indice]
                    Escribir "Cantidad: ", cantidad
                    Escribir "Precio unitario: $", precios[indice]
                    Escribir "Total: $", total
                    Escribir "Pago: $", pago
                    Escribir "Cambio: $", cambio
                    Escribir "?Gracias por su compra!"
                    Escribir "---------------------------"
                FinSi
            FinSi
        FinSi
    FinSi
FinSubProceso

// Funci?n para hacer corte de caja
SubProceso HacerCorteCaja(caja, ventasRealizadas)
    Escribir "===== CORTE DE CAJA ====="
    Escribir "Total en caja: $", caja
    Escribir "Ventas realizadas: ", ventasRealizadas
    Escribir "=========================="
FinSubProceso

// Funci?n para agregar un nuevo producto
SubProceso AgregarProducto(productos Por Referencia, claves Por Referencia, precios Por Referencia, inventario Por Referencia, n Por Referencia)
    Definir nombre Como Cadena
    Definir clave Como Cadena
    Definir precio Como Real
    Definir stock Como Entero
    Definir i Como Entero
    Definir claveExiste Como Logico
    
    Escribir "Ingrese el nombre del nuevo producto: "
    Leer nombre
    
    claveExiste <- Verdadero
    Mientras claveExiste Hacer
        Escribir "Ingrese la clave del producto (formato P###): "
        Leer clave
        
        claveExiste <- Falso
        Para i <- 0 Hasta n-1 Hacer
            Si claves[i] = clave Entonces
                claveExiste <- Verdadero
            FinSi
        FinPara
        
        Si claveExiste Entonces
            Escribir "La clave ya existe. Intente con otra."
        FinSi
    FinMientras
    
    precio <- 0
    Mientras precio <= 0 Hacer
        Escribir "Ingrese el precio del producto: $"
        Leer precio
        
        Si precio <= 0 Entonces
            Escribir "El precio debe ser mayor a cero."
        FinSi
    FinMientras
    
    stock <- -1
    Mientras stock < 0 Hacer
        Escribir "Ingrese la cantidad en inventario: "
        Leer stock
        
        Si stock < 0 Entonces
            Escribir "El inventario no puede ser negativo."
        FinSi
    FinMientras
    
    n <- n + 1
    productos[n] <- nombre
    claves[n] <- clave
    precios[n] <- precio
    inventario[n] <- stock
    
    Escribir "Producto agregado exitosamente:"
    Escribir "Nombre: ", nombre
    Escribir "Clave: ", clave
    Escribir "Precio: $", precio
    Escribir "Inventario: ", stock
FinSubProceso

// Funci?n para actualizar inventario
SubProceso ActualizarInventario(productos, claves, inventario Por Referencia, n)
    Definir clave Como Cadena
    Definir cantidad Como Entero
    Definir i, indice Como Entero
    Definir encontrado Como Logico
    
    Escribir "Ingrese la clave del producto a actualizar: "
    Leer clave
    
    encontrado <- Falso
    indice <- 0
    Para i <- 0 Hasta n -1 Hacer
        Si claves[i] = clave Entonces
            indice <- i
            encontrado <- Verdadero
        FinSi
    FinPara
    
    Si NO encontrado Entonces
        Escribir "Producto no encontrado. Verifique la clave."
    Sino
        Escribir "Producto: ", productos[indice]
        Escribir "Inventario actual: ", inventario[indice]
        Escribir "Ingrese la nueva cantidad en inventario: "
        Leer cantidad
        
        Si cantidad < 0 Entonces
            Escribir "El inventario no puede ser negativo."
        Sino
            inventario[indice] <- cantidad
            Escribir "Inventario actualizado correctamente."
        FinSi
    FinSi
FinSubProceso

// Funci?n para mostrar el cat?logo completo
SubProceso MostrarCatalogo(productos, claves, precios, inventario, n)
    Definir i Como Entero
    
    Escribir "========== CAT?LOGO DE PRODUCTOS =========="
    Escribir "CLAVE     PRODUCTO          PRECIO    STOCK"
    Escribir "============================================"
    
    Para i <- 0 Hasta n-1 Hacer
        Escribir claves[i], "      ", productos[i], "          $", precios[i], "     ", inventario[i]
    FinPara
    
    Escribir "============================================"
FinSubProceso

// Funci?n para buscar un producto por nombre o clave parcial
SubProceso BuscarProducto(productos, claves, precios, inventario, n)
    Definir busqueda Como Cadena
    Definir i Como Entero
    Definir encontrado Como Logico
    Definir hayCoincidencia Como Logico
    
    Escribir "Ingrese el nombre o parte de la clave del producto a buscar: "
    Leer busqueda
    busqueda <- Minusculas(busqueda)
    
    encontrado <- Falso
    Escribir "Resultados de la b?squeda:"
    Escribir "------------------------------------------------"
    
    Para i <- 0 Hasta n-1 Hacer
        hayCoincidencia <- Falso
        
        // Buscamos coincidencia en el nombre del producto
        Si Minusculas(productos[i]) = busqueda Entonces
            hayCoincidencia <- Verdadero
        FinSi
        
        // Buscamos coincidencia en la clave del producto
        Si Minusculas(claves[i]) = busqueda Entonces
            hayCoincidencia <- Verdadero
        FinSi
        
        Si hayCoincidencia Entonces
            Escribir "Clave: ", claves[i]
            Escribir "Producto: ", productos[i]
            Escribir "Precio: $", precios[i]
            Escribir "Inventario: ", inventario[i]
            Escribir "------------------------------------------------"
            encontrado <- Verdadero
        FinSi
    FinPara
    
    Si NO encontrado Entonces
        Escribir "No se encontraron productos con ese criterio de b?squeda."
    FinSi
FinSubProceso

// Algoritmo principal del sistema
Algoritmo Sistema_Gestion_Tienda
    Definir opcion Como Entero
    Definir salir Como Logico
    
    // Variables globales
    Definir productos Como Cadena
    Definir claves Como Cadena
    Definir precios Como Real
    Definir inventario Como Entero
    Definir n Como Entero  // Cantidad de productos
    Definir caja Como Real // Dinero en caja
    Definir ventasRealizadas Como Entero // Contador de ventas
    
    // Inicializaci?n
    n <- 6 // Ejemplo con 5 productos
    Dimension productos[n], claves[n], precios[n], inventario[n]
    caja <- 0
    ventasRealizadas <- 0
    
    // Datos de ejemplo
    CargarDatosIniciales(productos, claves, precios, inventario, n)
    
    salir <- Falso
    
    Mientras NO salir Hacer
        MostrarMenu
        Leer opcion
        
        Segun opcion Hacer
            1: // Consultar precio de un producto
				Leer lista_de_variables
                ConsultarPrecio(productos, claves, precios, n)
            2: // Realizar una venta
                RealizarVenta(productos, claves, precios, inventario, n, caja, ventasRealizadas)
            3: // Hacer corte de caja
                HacerCorteCaja(caja, ventasRealizadas)
            4: // Agregar nuevo producto
                AgregarProducto(productos, claves, precios, inventario, n)
            5: // Actualizar inventario
                ActualizarInventario(productos, claves, inventario, n)
            6: // Mostrar cat?logo completo
                MostrarCatalogo(productos, claves, precios, inventario, n)
            7: // Buscar producto
                BuscarProducto(productos, claves, precios, inventario, n)
            8: // Salir
                salir <- Verdadero
                Escribir "Gracias por utilizar el sistema. ?Hasta pronto!"
            De Otro Modo:
                Escribir "Opci?n no v?lida. Intente de nuevo."
        FinSegun
        
        Si NO salir Entonces
            Escribir "Presione Enter para continuar..."
            Esperar Tecla
            Limpiar Pantalla
        FinSi
    FinMientras
FinAlgoritmo