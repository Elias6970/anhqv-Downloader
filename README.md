# Aquí NO Hay Quien Viva Downloader
Aquí no hay quien viva downloader is a tool for download all the chapters
of the spanish serie using ffmpeg with an only bash script. The download is slow as it is downloaded from a web page. Is not a torrent.

Aquí no hay quien viva downloader es una herrramienta para descargar todos
capítulos de la serie española usando ffmpeg con solo un script en bash. La
descarga es lenta ya que se descarga desde una página web. No es un torrent.


## Usage
### Linux && Mac
1. Install ffmpeg / Instalar ffmpeg
    1. Linux
    ```bash
    sudo apt-get install ffmpeg
    ```
    2. Mac (you need to have installed Homebrew / necesitas tener instalado homebrew)
    * Install Homebrew (only if you haven't it) / Instalar Homebrew (solo si no lo tienes)
      ```bash
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      ```
    * Install ffmpeg / Instalar ffmpeg
      ```bash
      brew install ffmpeg
      ```
2. Give permission to execute to the script / Dar permisos de ejecución al script
  ```bash
    chmod +x anhqvDownloader.sh
  ```
3. Execute the script / Ejecutar el script
  ```bash
    ./anhqvDownloader.sh
  ```
4. Write the number option of you want to download / Introducir el número de
   la opción que quieres descargar
