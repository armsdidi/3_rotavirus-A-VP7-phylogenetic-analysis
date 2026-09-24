# Pipeline de Análise Filogenética do Gene VP7 de Rotavirus A

## Visão geral

Este repositório contém scripts em **Shell** e **R** desenvolvidos para a análise filogenética de sequências do gene **VP7 de Rotavirus A**.

A análise reúne **14 sequências** obtidas no **NCBI Nucleotide**: 10 de cepas humanas, três de cepas vacinais e uma de uma cepa identificada em corvo. As sequências pertencem aos genótipos **G1, G3, G4, G9, G10 e G40**.

O fluxo inclui alinhamento múltiplo, inspeção e edição manual do alinhamento, inferência filogenética por máxima verossimilhança, integração de metadados, cálculo de distâncias genéticas, reconstrução de uma árvore de Neighbor-Joining e análise de identidade nucleotídica.

---

## Fluxo de trabalho

As etapas foram realizadas na seguinte ordem:

- **Sequências do gene VP7 obtidas no NCBI Nucleotide** ↓
- **1. Alinhamento múltiplo com MAFFT** ↓
- **Inspeção e edição do alinhamento no AliView** ↓
- **2. Inferência filogenética por máxima verossimilhança com IQ-TREE 3** ↓
- **3. Caracterização filogenética e análise de distâncias genéticas** ↓
- **4. Análise de identidade nucleotídica**

---

## Estrutura do repositório

### `1_Alinhamento_múltiplo_de_sequências.sh`

Realiza o alinhamento múltiplo das 14 sequências do gene VP7 utilizando o **MAFFT**.

Após essa etapa, o alinhamento foi inspecionado visualmente no **AliView**. As extremidades sem sobreposição entre todas as sequências foram removidas, produzindo um alinhamento final com uma região compartilhada de **876 pares de bases (pb)**.

**Principais resultados:** alinhamento inicial gerado pelo MAFFT e alinhamento final editado no AliView.

---

### `2_Análise_filogenética.sh`

Utiliza o alinhamento final de 876 pb para inferir uma árvore filogenética pelo método de **Máxima Verossimilhança Maximum Likelihood)**, utilizando o **IQ-TREE 3**.

A análise emprega seleção de modelo com `-m MFP`, **1.000 replicações de ultrafast bootstrap** com `-B 1000` e **1.000 replicações do teste SH-aLRT** com `-alrt 1000`.

**Principais resultados:** árvore filogenética e arquivos de saída do IQ-TREE 3, incluindo o relatório `.iqtree`.

---

### `3_Caracterização_filogenética.Rmd`

Importa a árvore de máxima verossimilhança e integra os **metadados das sequências** para sua caracterização e visualização.

O script também calcula uma **matriz de distâncias genéticas**, gera um heatmap dessas distâncias e constrói uma árvore pelo método de **Neighbor-Joining (NJ)** a partir da matriz.

**Principais resultados:** visualização da árvore de máxima verossimilhança, matriz e heatmap de distâncias genéticas e árvore de Neighbor-Joining.

---

### `4_Identidade_nucleotídica.Rmd`

Importa o alinhamento final do gene VP7 para calcular a **identidade nucleotídica** entre as sequências analisadas.

Os valores são organizados em uma matriz e representados em um heatmap, permitindo visualizar a similaridade entre as cepas.

**Principais resultados:** matriz de identidade nucleotídica e heatmap de similaridade.

---

## Principais análises

O repositório contempla os seguintes componentes:

- Reunião de sequências públicas do gene VP7 em um arquivo FASTA
- Alinhamento múltiplo com MAFFT
- Inspeção e edição manual do alinhamento no AliView
- Inferência filogenética por máxima verossimilhança com IQ-TREE 3
- Avaliação do suporte dos ramos por ultrafast bootstrap e SH-aLRT
- Integração de metadados e visualização da árvore filogenética
- Cálculo e visualização de distâncias genéticas
- Reconstrução filogenética por Neighbor-Joining
- Cálculo e visualização da identidade nucleotídica

---

## Requisitos e dependências

### Ferramentas de linha de comando

- **MAFFT** — alinhamento múltiplo de sequências
- **IQ-TREE 3** — inferência filogenética por máxima verossimilhança

### Aplicativo com interface gráfica

- **AliView** — inspeção visual e edição manual do alinhamento após o MAFFT

### R

As análises posteriores são realizadas no **R** utilizando os seguintes pacotes:

- `tidyverse`
- `ape`
- `treeio`
- `ggtree`
- `ggplot2`
- `readxl`
- `openxlsx`
- `ComplexHeatmap`
- `Biostrings`
- `circlize`
- `grid`
- `phangorn`

Esses pacotes são utilizados para importar alinhamentos, árvores e metadados; calcular e exportar matrizes; reconstruir a árvore de Neighbor-Joining; e produzir as visualizações filogenéticas e os heatmaps. `grid` faz parte da instalação padrão do R.

---

## Dados de entrada

As sequências do gene VP7 foram obtidas no [NCBI Nucleotide](https://www.ncbi.nlm.nih.gov/nucleotide/) e reunidas em um único arquivo FASTA. **Os números de acesso individuais estão disponíveis no arquivo de metadados deste repositório**, permitindo localizar as sequências originais no NCBI.

Os principais arquivos utilizados no fluxo são:

- Arquivo FASTA contendo as 14 sequências do gene VP7
- Alinhamento final editado, com 876 pb
- Metadados das sequências, incluindo os números de acesso no NCBI
- Árvore filogenética gerada pelo IQ-TREE 3

---

## Reprodutibilidade

Os scripts estão numerados conforme a ordem recomendada de execução. A edição do alinhamento no **AliView** ocorre entre os scripts 1 e 2 e constitui uma etapa manual do fluxo.

Para reproduzir a análise, utilize o **alinhamento final de 876 pb** como entrada da inferência filogenética e das análises de distância genética e identidade nucleotídica. Os caminhos dos arquivos e os recursos computacionais devem ser ajustados ao ambiente de execução.

Recomenda-se registrar as versões do MAFFT, AliView, IQ-TREE 3, R e dos pacotes utilizados.

---

## Contexto da análise

Este fluxo foi desenvolvido para comparar sequências do gene VP7 de Rotavirus A provenientes de diferentes genótipos e origens. As árvores filogenéticas, as distâncias genéticas e a identidade nucleotídica oferecem formas complementares de examinar as relações entre as 14 sequências incluídas na análise.

---

## Autor

**Diego Pereira**

Bioinformatics Scientist | PhD in Genetics & Molecular Biology | NGS | R | Linux/Bash | Metagenomics & Metatranscriptomics
