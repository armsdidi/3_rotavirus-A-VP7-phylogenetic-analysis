#!/bin/bash

# ============================================================
# ANÁLISE FILOGENÉTICA
# IQ-TREE 3
# ============================================================

# Interrompe o script se ocorrer algum erro:
set -e

# Número de threads:
THREADS=1

# Diretórios:
BASE_DIR="$(pwd)"
PHYLOGENY_DIR="$BASE_DIR/RESULTS/PHYLOGENY"
ALIGNMENT="$PHYLOGENY_DIR/viral_sequences_aligned.aliview.fasta"

# Iniciando análise filogenética:
echo ">>> Iniciando análise filogenética..."

iqtree3 \
    -s "$ALIGNMENT" \
    -m MFP \
    -B 1000 \
    -alrt 1000 \
    -T "$THREADS" \
    --prefix "$PHYLOGENY_DIR/viral_phylogeny"

echo ">>> Análise filogenética concluída com sucesso."