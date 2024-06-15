#!/bin/bash

# Diretório de origem (assumido estar no mesmo diretório que o script)
SOURCE_DIR="$(dirname "$0")/arquivos"

# Diretório de destino (raiz do sistema)
DEST_DIR="/"

# Verifica se o diretório de origem existe
if [ ! -d "$SOURCE_DIR" ]; then
  echo "O diretório de origem '$SOURCE_DIR' não existe."
  exit 1
fi

# Copia todo o conteúdo do diretório de origem para o diretório de destino
cp -R "$SOURCE_DIR"/* "$DEST_DIR"

# Verifica se os arquivos foram copiados corretamente
if [ $? -ne 0 ]; then
  echo "Erro ao copiar arquivos do diretório '$SOURCE_DIR' para '$DEST_DIR'."
  exit 1
fi

# Aplica permissões de execução aos arquivos bin/quel e bin/quel-get
chmod +x /bin/quel /bin/quel-get

# Verifica se o chmod foi aplicado corretamente
if [ $? -ne 0 ]; then
  echo "Erro ao aplicar permissões de execução aos arquivos /bin/quel e /bin/quel-get."
  exit 1
fi

echo "Operação concluída com sucesso."
