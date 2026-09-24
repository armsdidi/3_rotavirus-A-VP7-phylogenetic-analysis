#!/bin/bash

# ============================================================
# ALINHAMENTO MÚLTIPLO DE SEQUÊNCIAS
# MAFFT
# ============================================================

# Interrompe o script se ocorrer algum erro:
set -e

# Número de threads:
THREADS=8

# Diretórios:
BASE_DIR="$(pwd)"
PHYLOGENY_DIR="$BASE_DIR/RESULTS/PHYLOGENY"
INPUT="$BASE_DIR/viral_sequences.fasta"
OUTPUT="$PHYLOGENY_DIR/viral_sequences_aligned.fasta"

# Criando os diretórios:
mkdir -p "$PHYLOGENY_DIR"

# Iniciando alinhamento múltiplo:
echo ">>> Iniciando alinhamento múltiplo..."

mafft \
    --auto \
    --thread "$THREADS" \
    "$INPUT" \
    > "$OUTPUT"

echo ">>> Alinhamento múltiplo de sequências concluído com sucesso."