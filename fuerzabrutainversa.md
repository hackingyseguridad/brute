## Fuera brura inversa o password spraying,  

Posibles escenarios de elementos que autentican :

1º.- Activo --------------------------LDAP

2º.- Activo ---- LDAP ---//relay//----LDAP

3º.- Activo ---- BBDD ----------------LDAP 

4º.- Activo ---- // ------------------DC Windows active directory

5º.- Activo ---- // ------------------DC Windows active directory

6º.- Activo -----//---- DC AD---------DC Windows active directory

Fuerza bruta intersa o password spraying: consiste en probar una misma password o unas pocas passwoord, para una lista grande de usuarios, de manera que  cuando volvamos a probar otra nueva password sobre un usuario haya pasado el tiempo de bloqueo o tiempo reset del contador de reintentos !!

Usuario1:Password00

Usuario2:Password00

Usuario3:Password00

Usuario4:Password00

Usuario5:Password00

Usuario6:Password00

...

- para eso hay que tener en cuenta en la configuración en Windows Server o LDAP, estos tres parametros que  forman parte de las políticas de bloqueo de cuentas para protegerse contra ataques de fuerza bruta. Aquí está su función explicada brevemente:

#### Account lockout threshold: 50 intentos fallidos

#### Reset lockout counter after: 15 minutos

#### Account lockout duration: 30 minutos

1. Account lockout threshold: 50 intentos fallidos

Define cuántos intentos fallidos de contraseña se permiten antes de bloquear la cuenta.

Evita que un atacante pruebe infinitas contraseñas (fuerza bruta).

Ejemplo: Si un usuario o atacante falla 10 veces seguidas, la cuenta se bloquea.

2. Reset lockout counter after: 15 minutos

Establece el tiempo que debe pasar sin intentos fallidos para que el contador de intentos se reinicie a cero.

Permite que los usuarios legítimos recuperen acceso si cometieron errores temporales.

Ejemplo: Si un usuario falla 5 veces, pero espera 15 minutos sin intentar ingresar, el contador vuelve a 0.

3. Account lockout duration: 30 minutos

Determina cuánto tiempo permanece bloqueada la cuenta tras superar el límite de intentos fallidos.

Ralentiza los ataques automatizados al forzar una pausa.

Ejemplo: Si una cuenta se bloquea, el usuario/atacante no podrá intentar de nuevo hasta que pasen 30 minutos (o hasta que un administrador la desbloquee).

Relación entre ellas (ejemplo práctico):

Un atacante prueba 50 contraseñas incorrectas → bloqueo automático (threshold).

Si el atacante espera 15 minutos sin intentos, el contador se reinicia → puede volver a intentar.

Si la cuenta se bloquea, estará inaccesible durante 30 minutos (duración del bloqueo).

configurar según el entorno:

Entornos críticos: Threshold bajo (5-10), duración larga (1h+).

Entornos flexibles: Threshold alto (15-20), duración corta (15-30 min).


http://www.hackingyseguridad.com/


