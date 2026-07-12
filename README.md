### Brute — Subrutinas de Fuerza Bruta para Auditorías de Autenticación

![License](https://img.shields.io/badge/license-GPL--3.0-blue.svg)
![Shell](https://img.shields.io/badge/shell-bash-green.svg)
![Python](https://img.shields.io/badge/python-3.x-yellow.svg)
![Status](https://img.shields.io/badge/status-activo-brightgreen.svg)

```
██████╗ ██████╗ ██╗   ██╗████████╗███████╗
██╔══██╗██╔══██╗██║   ██║╚══██╔══╝██╔════╝
██████╔╝██████╔╝██║   ██║   ██║   █████╗  
██╔══██╗██╔══██╗██║   ██║   ██║   ██╔══╝  
██████╔╝██║  ██║╚██████╔╝   ██║   ███████╗
╚═════╝ ╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚══════╝
```

Colección de **subrutinas de fuerza bruta** (Bash, Python y Batch) para probar la robustez de la autenticación en más de **20 protocolos y servicios distintos**: SSH, FTP, RDP, SMB, bases de datos, correo, VoIP, VPN, WordPress, y más.

---

### Tabla de contenidos

- [¿Qué es un ataque de fuerza bruta?](#-qué-es-un-ataque-de-fuerza-bruta)
- [¿Qué incluye este repositorio?](#-qué-incluye-este-repositorio)
- [Requisitos](#-requisitos)
- [Instalación](#-instalación)
- [Uso rápido](#-uso-rápido)
- [Catálogo de scripts por protocolo](#-catálogo-de-scripts-por-protocolo)
- [Utilidades auxiliares](#-utilidades-auxiliares)
- [Documentación conceptual](#-documentación-conceptual)
- [Diccionarios / wordlists](#-diccionarios--wordlists)
- [Buenas prácticas de defensa](#️-buenas-prácticas-de-defensa)
- [Aviso legal / Uso responsable](#️-aviso-legal--uso-responsable)
- [Licencia](#-licencia)
- [Contribuciones](#-contribuciones)

---

### ataque de fuerza bruta

Un **ataque de fuerza bruta** (*brute force*) consiste en probar de forma sistemática miles o millones de combinaciones de usuario y/o contraseña contra un servicio de autenticación hasta dar con una credencial válida. Es especialmente efectivo cuando:

- Las contraseñas son cortas, comunes o reutilizadas.
- No existe bloqueo de cuenta tras varios intentos fallidos (*account lockout*).
- No hay límite de peticiones (*rate limiting*) ni CAPTCHA.
- No se emplea autenticación multifactor (MFA).

Existen dos variantes principales:

| Variante | Descripción |
|---|---|
| **Fuerza bruta directa** | Se prueban múltiples contraseñas contra **un único usuario** conocido |
| **Fuerza bruta inversa** (*reverse brute force* / *password spraying*) | Se prueba **una misma contraseña** (o pocas, muy comunes) contra **muchos usuarios**, para evitar bloqueos por intentos repetidos en una sola cuenta |

Este repositorio documenta ambas técnicas — ver [`fuerzabrutadirecta.md`](fuerzabrutadirecta.md) y [`fuerzabrutainversa.md`](fuerzabrutainversa.md).

---

###  Fierza bruta

| Categoría | Contenido |
|---|---|
|  Scripts de fuerza bruta | Más de 50 scripts dirigidos a distintos protocolos y servicios |
|  Automatización | Scripts de ataque masivo/automático (SSH masivo, escaneo por rangos, etc.) |
|  Diccionarios | Enlace al repositorio externo de wordlists ([diccionarios](https://github.com/hackingyseguridad/diccionarios/)) |
|  Utilidades | Generación y gestión de listas de claves, codificación Base64, instalación de dependencias |
|  Documentación | Explicación conceptual de fuerza bruta directa e inversa |
|  Soporte multiplataforma | Versiones `.sh` (Linux) y `.bat` (Windows) para algunos scripts |

---

### Requisitos

- Sistema Linux/Unix (recomendado Kali, Parrot OS o similar) — algunos scripts tienen variante `.bat` para Windows
- `bash`
- `python3` (para `telnetbypass.py`)
- Clientes de red según el servicio a auditar: `hydra`, `curl`, `nc`, `ssh`, `ftp`, `smbclient`, `mysql`, `psql`, etc. (revisa cada script para sus dependencias concretas)
- Diccionarios de usuarios/contraseñas (ver [Diccionarios](#-diccionarios--wordlists))
- **Autorización explícita** para auditar el sistema objetivo

---

###  Instalación

```bash
git clone https://github.com/hackingyseguridad/brute.git
cd brute
chmod +x *.sh
./instalar.sh
```

Actualizar el repositorio y los diccionarios asociados:

```bash
./actualizar.sh        # Linux
actualizar.bat         # Windows
```

---

### Uso rápido

```bash
# Fuerza bruta contra un servicio SSH
./brutessh.sh <ip> <usuario> <diccionario_de_claves>

# Fuerza bruta masiva contra un rango de servidores SSH
./brutesshmasivo.sh <rango_ips> <diccionario>

# Fuerza bruta contra FTP
./bruteftp.sh <ip> <usuario> <diccionario>

# Fuerza bruta contra un panel de WordPress (wp-login.php)
./brutewordpress.sh <url_objetivo> <usuario> <diccionario>
```

> Cada script puede tener parámetros ligeramente distintos entre sí (versiones `0`, `1`, `2`... suelen representar variantes o mejoras del mismo ataque). Revisa la cabecera de cada archivo para conocer su sintaxis exacta.

---

### scripts por protocolo

###  SSH (Secure Shell)

| Script | Descripción |
|---|---|
| `brutessh.sh` / `brutessh.bat` | Ataque de fuerza bruta estándar contra SSH |
| `brutessh0.sh` … `brutessh9.sh` | Variantes/iteraciones del ataque SSH (distintos métodos o mejoras) |
| `brutessh2.bat` | Variante para entorno Windows |
| `brutesshauto.sh` / `brutesshauto1.sh` | Automatización del ataque contra uno o varios objetivos |
| `brutesshmasivo.sh` | Ataque masivo contra un rango/listado de IPs |

###  FTP (File Transfer Protocol)

| Script | Descripción |
|---|---|
| `bruteftp.sh` | Ataque de fuerza bruta estándar contra FTP |
| `bruteftp2.sh` / `bruteftp3.sh` / `bruteftp4.sh` | Variantes del ataque (distintos métodos de conexión/autenticación) |

###  HTTP / Web

| Script | Descripción |
|---|---|
| `brutehttp.sh` | Fuerza bruta genérica sobre formularios/autenticación HTTP |
| `brutehttp0.sh` … `brutehttp8.sh` | Variantes del ataque HTTP (Basic Auth, formularios, distintos métodos) |
| `authbasic.sh` | Ataque específico contra autenticación HTTP Basic |
| `brutewordpress.sh` | Fuerza bruta dirigida al panel de login de WordPress |

###  RDP (Remote Desktop Protocol)

| Script | Descripción |
|---|---|
| `bruterdp.sh` | Ataque de fuerza bruta contra RDP |
| `bruterdp2.sh` | Variante del ataque RDP |

###  Bases de datos

| Script | Servicio |
|---|---|
| `brutemysql.sh` / `brutemysql2.sh` | MySQL |
| `brutems-sql.sh` | Microsoft SQL Server |
| `brutepostgresql.sh` | PostgreSQL |

###  Correo electrónico

| Script | Protocolo |
|---|---|
| `bruteimap.sh` | IMAP |
| `brutepop3.sh` / `brutepop3b.sh` | POP3 |
| `brutesmtp.sh` / `brutesmtp2.sh` | SMTP |

###  Telefonía / VoIP y VPN

| Script | Protocolo |
|---|---|
| `brutesip.sh` | SIP (VoIP) |
| `bruteike.sh` | IKE (negociación IPsec / VPN) |

### Compartición de archivos y administración remota

| Script | Protocolo |
|---|---|
| `brutesmb.sh` / `brutesmb2.sh` | SMB (recursos compartidos Windows) |
| `bruterpc.sh` | RPC |
| `brutersh.sh` | RSH (Remote Shell) |
| `brutevnc.sh` | VNC (escritorio remoto) |

### Telnet

| Script | Descripción |
|---|---|
| `brutetelnet.sh` … `brutetelnet4.sh` | Variantes del ataque de fuerza bruta contra Telnet |
| `telnetbypass.py` | Bypass/prueba de autenticación Telnet en Python |
| `telnetbypass2.sh` | Variante del bypass en Bash |

---

### Utilidades

| Script | Función |
|---|---|
| `instalar.sh` | Instala dependencias necesarias para ejecutar el toolkit |
| `actualizar.sh` / `actualizar.bat` | Actualiza el repositorio y diccionarios asociados |
| `claves.sh` | Gestión/tratamiento de listas de contraseñas |
| `generaclaves.sh` | Generador de diccionarios de contraseñas personalizados |
| `base64.sh` | Codificación/decodificación en Base64 (útil para cabeceras de auth HTTP Basic) |

---

### Documentación 

| Documento | Contenido |
|---|---|
| [`fuerzabrutadirecta.md`](fuerzabrutadirecta.md) | Explicación de la técnica de fuerza bruta directa (un usuario, muchas contraseñas) |
| [`fuerzabrutainversa.md`](fuerzabrutainversa.md) | Explicación de la técnica de fuerza bruta inversa / password spraying (una contraseña, muchos usuarios) |

---

### Diccionarios / wordlists

Los diccionarios de usuarios y contraseñas utilizados por los scripts se mantienen en un repositorio independiente:

🔗 [github.com/hackingyseguridad/diccionarios](https://github.com/hackingyseguridad/diccionarios/)

---

### Recomendaciones

algunas medidas recomendadas para mitigar ataques de fuerza bruta son:

| Medida | Efecto |
|---|---|
| Bloqueo de cuenta tras N intentos fallidos | Detiene la fuerza bruta directa |
| Limitación de tasa (*rate limiting*) por IP | Ralentiza o detiene ataques automatizados |
| Autenticación multifactor (MFA) | Neutraliza el impacto de credenciales comprometidas |
| Uso de contraseñas robustas y únicas | Reduce drásticamente la superficie de ataque |
| Monitorización y alertas (SIEM/IDS) | Detección temprana de intentos masivos |
| Cambiar puertos por defecto / restringir por IP | Reduce exposición ante escaneos automáticos |
| Fail2ban u otras herramientas de baneo automático | Bloquea IPs con comportamiento sospechoso |

---


#

[www.hackingyseguridad.com](http://www.hackingyseguridad.com/)

[github.com/hackingyseguridad/diccionarios](https://github.com/hackingyseguridad/diccionarios/)

#
