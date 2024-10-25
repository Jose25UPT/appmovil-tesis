Aquí tienes todos los diagramas de casos de uso del 1 al 14 ajustados con el actor y las relaciones <<include>> y <<extend>> alineadas a los costados del caso de uso principal:

1. Diagrama de Casos de Uso: Inicio de Sesión (RF-1)
plantuml
Copiar código
@startuml
left to right direction
actor Usuario as actor

actor --> (Iniciar Sesión)

(Iniciar Sesión) -down-> (Validar Credenciales) : <<include>>
(Iniciar Sesión) -up-> (Mostrar Mensaje de Error) : <<extend>>
@enduml
2. Diagrama de Casos de Uso: Registro de Usuario (RF-2)
plantuml
Copiar código
@startuml
left to right direction
actor Usuario as actor

actor --> (Registro de Usuario)

(Registro de Usuario) -down-> (Verificar Información) : <<include>>
(Verificar Información) -down-> (Confirmar Registro) : <<include>>
(Verificar Información) -up-> (Mostrar Mensaje de Error) : <<extend>>
@enduml
3. Diagrama de Casos de Uso: Dashboard (RF-3)
plantuml
Copiar código
@startuml
left to right direction
actor Usuario as actor

actor --> (Acceder al Dashboard)

(Acceder al Dashboard) -down-> (Visualizar Información de Seguridad) : <<include>>
(Acceder al Dashboard) -left-> (Visualizar Alertas) : <<include>>
(Acceder al Dashboard) -up-> (Ver Resumen de Análisis) : <<include>>
@enduml
4. Diagrama de Casos de Uso: Alertas y Notificaciones (RF-4)
plantuml
Copiar código
@startuml
left to right direction
actor Usuario as actor

actor --> (Recibir Alertas y Notificaciones)

(Recibir Alertas y Notificaciones) -up-> (Mostrar Detalles de Amenaza) : <<extend>>
@enduml
5. Diagrama de Casos de Uso: Configuración de Seguridad (RF-5)
plantuml
Copiar código
@startuml
left to right direction
actor Usuario as actor

actor --> (Acceder a Configuración de Seguridad)

(Acceder a Configuración de Seguridad) -down-> (Modificar Preferencias) : <<include>>
(Modificar Preferencias) -down-> (Guardar Cambios) : <<include>>
@enduml
6. Diagrama de Casos de Uso: Escaneo de Seguridad (RF-6)
plantuml
Copiar código
@startuml
left to right direction
actor Usuario as actor

actor --> (Iniciar Escaneo de Seguridad)

(Iniciar Escaneo de Seguridad) -down-> (Mostrar Resultados de Escaneo) : <<include>>
(Mostrar Resultados de Escaneo) -down-> (Generar Informe de Análisis) : <<include>>
(Mostrar Resultados de Escaneo) -up-> (Mostrar Vulnerabilidades) : <<extend>>
@enduml
7. Diagrama de Casos de Uso: Historial de Análisis (RF-7)
plantuml
Copiar código
@startuml
left to right direction
actor Usuario as actor

actor --> (Acceder al Historial de Análisis)

(Acceder al Historial de Análisis) -down-> (Ver Resultados Pasados) : <<include>>
(Ver Resultados Pasados) -down-> (Seleccionar Análisis) : <<include>>
@enduml
8. Diagrama de Casos de Uso: Perfil de Usuario (RF-8)
plantuml
Copiar código
@startuml
left to right direction
actor Usuario as actor

actor --> (Acceder a Perfil de Usuario)

(Acceder a Perfil de Usuario) -down-> (Modificar Información de Perfil) : <<include>>
(Modificar Información de Perfil) -down-> (Guardar Cambios) : <<include>>
@enduml
9. Diagrama de Casos de Uso: Reporte de Análisis (RF-9)
plantuml
Copiar código
@startuml
left to right direction
actor Usuario as actor

actor --> (Generar Reporte de Análisis)

(Generar Reporte de Análisis) -down-> (Descargar Reporte) : <<include>>
@enduml
10. Diagrama de Casos de Uso: Resumen de Seguridad (RF-10)
plantuml
Copiar código
@startuml
left to right direction
actor Usuario as actor

actor --> (Acceder a Resumen de Seguridad)

(Acceder a Resumen de Seguridad) -down-> (Ver Estado del Dispositivo) : <<include>>
(Acceder a Resumen de Seguridad) -up-> (Ver Gráficos de Seguridad) : <<include>>
@enduml
11. Diagrama de Casos de Uso: Aplicaciones Instaladas (RF-11)
plantuml
Copiar código
@startuml
left to right direction
actor Usuario as actor

actor --> (Ver Aplicaciones Instaladas)

(Ver Aplicaciones Instaladas) -down-> (Seleccionar Aplicación) : <<include>>
@enduml
12. Diagrama de Casos de Uso: Detalles de Aplicación (RF-12)
plantuml
Copiar código
@startuml
left to right direction
actor Usuario as actor

actor --> (Ver Detalles de Aplicación)

(Ver Detalles de Aplicación) -down-> (Ver Permisos) : <<include>>
(Ver Detalles de Aplicación) -up-> (Ver Consumo de Recursos) : <<include>>
@enduml
13. Diagrama de Casos de Uso: Gestión de Permisos (RF-13)
plantuml
Copiar código
@startuml
left to right direction
actor Usuario as actor

actor --> (Gestionar Permisos de Aplicaciones)

(Gestionar Permisos de Aplicaciones) -down-> (Actualizar Permisos) : <<include>>
@enduml
14. Diagrama de Casos de Uso: Tema Personalizado (RF-14)
plantuml
Copiar código
@startuml
left to right direction
actor Usuario as actor

actor --> (Personalizar Tema)

(Personalizar Tema) -down-> (Seleccionar Opciones) : <<include>>
(Seleccionar Opciones) -down-> (Guardar Cambios) : <<include>>
@enduml