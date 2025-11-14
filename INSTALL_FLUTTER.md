# 🚀 Guia de Instalação do Flutter no Linux

## Método 1: Script Automático (Recomendado)

Execute o script de instalação incluído no projeto:

```bash
chmod +x install_flutter.sh
bash install_flutter.sh
```

## Método 2: Instalação Manual

### Passo 1: Instalar Dependências

```bash
sudo apt-get update
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa clang cmake ninja-build pkg-config libgtk-3-dev
```

### Passo 2: Baixar Flutter SDK

```bash
cd ~
mkdir -p desenvolvimento
cd desenvolvimento
git clone https://github.com/flutter/flutter.git -b stable --depth 1
```

### Passo 3: Configurar PATH

Adicione o Flutter ao seu PATH editando o arquivo de configuração do shell:

#### Para Bash (~/.bashrc):

```bash
echo 'export PATH="$HOME/desenvolvimento/flutter/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

#### Para Zsh (~/.zshrc):

```bash
echo 'export PATH="$HOME/desenvolvimento/flutter/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

### Passo 4: Verificar Instalação

```bash
flutter doctor
```

### Passo 5: Configurar Android (Opcional, mas recomendado)

#### Instalar Android Studio:

1. Baixe do site oficial: https://developer.android.com/studio
2. Ou use snap:

```bash
sudo snap install android-studio --classic
```

3. Abra o Android Studio e instale:

   - Android SDK
   - Android SDK Platform-Tools
   - Android SDK Build-Tools

4. Aceite as licenças:

```bash
flutter doctor --android-licenses
```

### Passo 6: Configurar um Emulador Android (Opcional)

No Android Studio:

1. Abra **Tools > AVD Manager**
2. Crie um novo dispositivo virtual
3. Escolha um dispositivo (ex: Pixel 6)
4. Selecione uma imagem do sistema (recomendado: API 33 ou superior)

## Método 3: Usando Snap (Mais Simples)

```bash
sudo snap install flutter --classic
```

Depois:

```bash
flutter sdk-path
flutter doctor
```

## Verificação Final

Após a instalação, execute:

```bash
flutter --version
flutter doctor -v
```

O `flutter doctor` mostrará o status de todos os componentes necessários.

## Configuração do Projeto Agenda Estóica

Após instalar o Flutter:

```bash
cd ~/Documentos/GitHub/karen-hagmayer-wisdom/agenda-estoica-app

# Instalar dependências
flutter pub get

# Gerar código (adaptadores Hive)
flutter pub run build_runner build --delete-conflicting-outputs

# Verificar dispositivos disponíveis
flutter devices

# Executar o app
flutter run
```

## Troubleshooting

### Problema: Flutter não encontrado após instalação

**Solução:** Feche e abra o terminal novamente, ou execute:

```bash
source ~/.bashrc  # ou ~/.zshrc
```

### Problema: Android licenses não aceitas

**Solução:**

```bash
flutter doctor --android-licenses
```

Pressione 'y' para aceitar todas as licenças.

### Problema: Nenhum dispositivo disponível

**Soluções:**

- Conecte um dispositivo físico via USB e ative depuração USB
- Inicie um emulador Android via Android Studio
- Use Chrome para web: `flutter run -d chrome`
- Use Linux desktop: `flutter run -d linux`

### Problema: Erro com gradle/Android SDK

**Solução:**

```bash
flutter clean
flutter pub get
flutter run
```

## Requisitos de Sistema

- **SO**: Ubuntu 18.04 ou superior (ou distribuições equivalentes)
- **Espaço em disco**: ~3 GB (Flutter SDK + Android tools)
- **RAM**: 8 GB recomendado
- **Ferramentas**: Git, curl, unzip

## Recursos Adicionais

- 📚 Documentação oficial: https://docs.flutter.dev/get-started/install/linux
- 🎓 Flutter tutorial: https://flutter.dev/docs/get-started/codelab
- 💬 Comunidade: https://flutter.dev/community

## Próximos Passos

1. ✅ Instalar Flutter
2. ✅ Executar `flutter doctor`
3. ✅ Instalar Android Studio (opcional)
4. ✅ Baixar fontes Lato para `assets/fonts/`
5. ✅ Executar o projeto: `flutter run`

---

**Dica:** Para desenvolvimento mais rápido, considere usar um editor leve como VS Code com as extensões Flutter e Dart instaladas.
