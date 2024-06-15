#!/bin/bash

# Diretório de origem (assumido estar no mesmo diretório que o script)
SOURCE_DIR="$(dirname "$0")/arquivos"

# Verifica se o diretório de origem existe
if [ ! -d "$SOURCE_DIR" ]; then
  echo "O diretório de origem '$SOURCE_DIR' não existe."
  exit 1
fi

# Função para copiar arquivos e diretórios preservando a estrutura
copy_files() {
  local src_dir=$1
  local dest_dir=$2

  # Copia todos os arquivos e diretórios, excluindo o próprio diretório fonte
  find "$src_dir" -mindepth 1 -exec cp -r {} "$dest_dir" \;
}

# Copia todo o conteúdo do diretório bin de origem para /bin no destino
copy_files "$SOURCE_DIR/bin" "/bin"

# Verifica se os arquivos foram copiados corretamente
if [ $? -ne 0 ]; then
  echo "Erro ao copiar arquivos do diretório '$SOURCE_DIR/bin' para '/bin'."
  exit 1
fi

# Cria o diretório /etc/quel/ se ele não existir
mkdir -p "/etc/quel"

# Copia o arquivo repo para /etc/quel/
cp "$SOURCE_DIR/etc/quel/repo" "/etc/quel/repo"

# Verifica se o arquivo repo foi copiado corretamente
if [ $? -ne 0 ]; then
  echo "Erro ao copiar o arquivo repo para /etc/quel/."
  exit 1
fi

# Aplica permissões de execução aos arquivos /bin/quel e /bin/quel-get
chmod +x /bin/quel /bin/quel-get

# Verifica se o chmod foi aplicado corretamente
if [ $? -ne 0 ]; then
  echo "Erro ao aplicar permissões de execução aos arquivos /bin/quel e /bin/quel-get."
  exit 1
fi

echo "Operação concluída com sucesso."
