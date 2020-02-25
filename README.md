# Segundo cuatrimestre de cuarto (DGIIM)

Sólo uso este repositorio como backup para mis distintos ordenadores. Las presentaciones de clase, apuntes y material docente vario que se encuentre en este repositorio, que no lleve mi nombre, no es mío.

## Vim

- Configuration file [link](https://stackoverflow.com/questions/10921441/where-is-my-vimrc-file)
- Vim Module Manager [link](https://github.com/VundleVim/Vundle.vim)
- Vim autosave [link](https://github.com/907th/vim-auto-save)
- Vim markdown tables [link](https://thoughtbot.com/blog/align-github-flavored-markdown-tables-in-vim)
- Select text vim [link](https://stackoverflow.com/questions/17890904/how-do-you-select-text-in-vim)
- Vim commmon [link](https://alvinalexander.com/linux/vi-vim-editor-end-of-line)

## Configuración de Latex

Para usar los mismos comandos en todos los archivos, lo más cómodo es definir tu propio paquete de Latex y hacer que este disponible mediante `\usepackage{}`. [Tutorial](https://tex.stackexchange.com/questions/1137/where-do-i-place-my-own-sty-or-cls-files-to-make-them-available-to-all-my-te)

Además, si quieres mantener esa copia en un sistema de control de versiones, puedes añadir esto al final de tu `.zshrc`:

~~~bash
cp -a ~/texmf ~/code/cuarto-segundo-cuatrimestre/
~~~

## Uso en Anki

Si usas Anki, recomiendo escribir las tarjetas en un editor como `TexMaker` y luego copiar el contenido. Para usarlo, ve a `Tools->Manage Note Types->Options` y añade el siguiente código antes de `\begin{document}`:

~~~latex
\usepackage{amsmath,amsthm,amssymb}
\usepackage{config}
~~~

## Links útiles:

### Servidores web de altas prestaciones (SWAP)

- Iniciar Virtual Box desde un script [link](https://www.techrepublic.com/article/how-to-create-a-bash-script-for-starting-virtualbox-vms/).

### Transmisión de datos y redes de computadores (TDRC)

### Administración de bases de datos (ABD)

### Ingeniería, empresa y sociedad

### Curvas y superficies

- Material vario [link](http://mathshistory.st-andrews.ac.uk/)

### Ecuaciones diferenciales II

- Plataforma docente usada [link](http://vvv.ugr.es/)

### Modelos Matemáticos II
