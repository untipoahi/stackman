# 🐳 Stackman

**Stackman** es una herramienta ligera y rápida para gestionar múltiples proyectos `docker-compose` desde la terminal, sin navegar carpeta por carpeta.

📁 Escanea tu carpeta `~/workspace`, detecta `docker-compose.yml` y permite iniciar, detener, reiniciar o monitorear cualquier stack con un comando simple.

---

## 🚀 Instalación

```bash
git clone https://github.com/untipoahi/stackman.git ~/.stackman
cd ~/.stackman
chmod +x stackman.sh scan.sh
echo 'alias stackman="$HOME/.stackman/stackman.sh"' >> ~/.bashrc
source ~/.bashrc
stackman scan

> ☝️ Asegurate de tener los proyectos con docker-compose.yml dentro de ~/workspace (hasta 2 niveles de profundidad).

🧠 Comandos disponibles

bash

stackman                   # Muestra los stacks disponibles y las acciones posibles  
stackman scan              # Reescanea ~/workspace y actualiza la lista  
stackman list              # Lista todos los stacks registrados  
stackman ps                # Muestra el estado actual de todos los stacks  
stackman up <stack>        # Inicia el stack indicado  
stackman down <stack>      # Detiene el stack  
stackman logs <stack>      # Muestra los logs en vivo  
stackman restart <stack>   # Reinicia el stack  

📂 El archivo ~/.stackman/stacks.txt contiene las rutas escaneadas con el formato:

nombre-carpeta=/ruta/completa/al/proyecto

✨ Características

    🧭 Detección automática de stacks
    ⚙️ Control total desde un solo comando
    🚫 Sin necesidad de navegar carpetas
    ⚡ Integración fluida con docker compose
    🧩 Listo para extender con autocompletado o menús interactivos

📬 Contribuciones

Pull requests y sugerencias son más que bienvenidas. Podés abrir un issue o mandarme un mensaje con ideas 🔧

⚖️ Licencia

https://opensource.org/licenses/MIT

