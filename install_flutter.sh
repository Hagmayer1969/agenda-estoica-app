#!/bin/bash

# Script de instalação do Flutter para Linux
# Execute com: bash install_flutter.sh

set -e

echo "🚀 Instalando Flutter no Linux..."

# Cores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Verificar dependências
echo -e "${BLUE}📋 Verificando dependências...${NC}"
sudo apt-get update
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa clang cmake ninja-build pkg-config libgtk-3-dev

# Criar diretório para o Flutter
FLUTTER_DIR="$HOME/desenvolvimento/flutter"
echo -e "${BLUE}📁 Criando diretório: $FLUTTER_DIR${NC}"
mkdir -p $HOME/desenvolvimento

# Baixar Flutter
cd $HOME/desenvolvimento
echo -e "${BLUE}⬇️  Baixando Flutter SDK (versão estável)...${NC}"
if [ -d "flutter" ]; then
    echo -e "${YELLOW}⚠️  Diretório flutter já existe. Removendo...${NC}"
    rm -rf flutter
fi

git clone https://github.com/flutter/flutter.git -b stable --depth 1

# Adicionar Flutter ao PATH
SHELL_CONFIG=""
if [ -f "$HOME/.bashrc" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
elif [ -f "$HOME/.zshrc" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
fi

if [ -n "$SHELL_CONFIG" ]; then
    echo -e "${BLUE}🔧 Configurando PATH em $SHELL_CONFIG${NC}"
    
    # Remover entradas antigas do Flutter se existirem
    sed -i '/flutter\/bin/d' "$SHELL_CONFIG"
    
    # Adicionar nova entrada
    echo "" >> "$SHELL_CONFIG"
    echo "# Flutter" >> "$SHELL_CONFIG"
    echo "export PATH=\"\$HOME/desenvolvimento/flutter/bin:\$PATH\"" >> "$SHELL_CONFIG"
    
    # Carregar configuração
    source "$SHELL_CONFIG"
fi

# Adicionar Flutter ao PATH da sessão atual
export PATH="$HOME/desenvolvimento/flutter/bin:$PATH"

# Executar flutter doctor para configurar
echo -e "${BLUE}🏥 Executando flutter doctor...${NC}"
flutter doctor

echo ""
echo -e "${GREEN}✅ Flutter instalado com sucesso!${NC}"
echo ""
echo -e "${YELLOW}📝 Próximos passos:${NC}"
echo "1. Feche e abra o terminal novamente (ou execute: source ~/.bashrc)"
echo "2. Execute: flutter doctor"
echo "3. Siga as instruções do flutter doctor para instalar componentes adicionais"
echo "4. Para desenvolvimento Android, instale o Android Studio"
echo "5. Execute: flutter doctor --android-licenses (para aceitar licenças Android)"
echo ""
echo -e "${BLUE}Para testar a instalação, execute:${NC}"
echo "  flutter --version"
echo "  flutter doctor -v"
