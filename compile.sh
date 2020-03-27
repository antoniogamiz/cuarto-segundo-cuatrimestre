#!/bin/bash

SUBJECTS=(abd curvas ecuaciones empresa modelos redes swap)
SUBFOLDERS=(teoria practicas entregas)
OUTPUT_DIR=$(pwd)/pdfs
export TEXINPUTS=$(pwd)/sty/:

clear_output_dir () {
    find $OUTPUT_DIR \( -name "*.aux" -o -name "*.log" -o -name "*.out" -o -name "*.gz" -o -name "*.toc" \) -type f -delete
}

compile_document () {
    # compile twice until I find another way to generate indexes
    pdflatex -synctex=1 -interaction=nonstopmode -halt-on-error -output-directory=$1 $2
    pdflatex -synctex=1 -interaction=nonstopmode -halt-on-error -output-directory=$1 $2
}

compile_files_in_subject () {
    TEXFILES=( *.tex )
    for file in ${TEXFILES[@]}
    do
        if [ "$file" != "*.tex" ]; then
            echo "Compiling" $file
            compile_document $1 $file
        fi
    done
}

mkdir -p $OUTPUT_DIR
for dir in ${SUBJECTS[@]}
do
    cd $dir
    echo "Building" $dir "directory"
    mkdir -p $OUTPUT_DIR/$dir
    for subdir in ${SUBFOLDERS[@]}
    do
        mkdir -p $subdir && cd $subdir
        echo "Building" $subdir "subdirectory" 
        mkdir -p $OUTPUT_DIR/$dir/$subdir && mkdir -p $OUTPUT_DIR/$dir/$subdir/sections
        compile_files_in_subject $OUTPUT_DIR/$dir/$subdir
        cd ..
    done
    cd ..
done
clear_output_dir

