# 🖥️ Como Visualizar o App Agenda Estóica

## Opções para Visualizar o Aplicativo

### 1. 🌐 Via Navegador Web (Mais Rápido - Sem instalar nada)

Se você tem o Flutter instalado, pode executar direto no Chrome/Edge:

```bash
# Habilitar suporte web (apenas uma vez)
flutter config --enable-web

# Executar no navegador
flutter run -d chrome
```

**Vantagens:**

- ✅ Não precisa de emulador Android
- ✅ Mais rápido para testar
- ✅ Hot reload instantâneo

---

### 2. 🖥️ Desktop Linux (Aplicativo Nativo)

Execute como aplicativo desktop no Linux:

```bash
# Habilitar suporte Linux desktop (apenas uma vez)
flutter config --enable-linux-desktop

# Executar no desktop
flutter run -d linux
```

**Vantagens:**

- ✅ Aplicativo nativo
- ✅ Não precisa de emulador
- ✅ Performance melhor que web

---

### 3. 📱 Emulador Android

#### Opção A: Usando Android Studio

1. **Instalar Android Studio:**

```bash
sudo snap install android-studio --classic
```

2. **Configurar Android Studio:**

   - Abra Android Studio
   - Siga o assistente de configuração
   - Instale Android SDK

3. **Criar um emulador:**

   - No Android Studio, vá em **Tools > Device Manager**
   - Clique em **Create Device**
   - Escolha um dispositivo (ex: Pixel 6)
   - Selecione uma System Image (recomendado: API 33 - Android 13)
   - Clique em **Finish**

4. **Iniciar o emulador e executar:**

```bash
# Listar emuladores disponíveis
flutter emulators

# Iniciar um emulador específico
flutter emulators --launch <emulator_id>

# Ou simplesmente executar (Flutter inicia automaticamente)
flutter run
```

#### Opção B: Dispositivo Físico Android

1. **No seu celular Android:**

   - Vá em **Configurações > Sobre o telefone**
   - Toque 7 vezes em **Número da versão** para ativar opções de desenvolvedor
   - Volte e vá em **Opções de desenvolvedor**
   - Ative **Depuração USB**

2. **Conecte o celular ao computador via USB**

3. **Execute:**

```bash
# Verificar se o dispositivo foi detectado
flutter devices

# Executar no dispositivo
flutter run
```

---

## 🚀 Passo a Passo Completo

### Pré-requisitos

```bash
# 1. Verificar se o Flutter está instalado
flutter --version

# Se não estiver, instale:
sudo snap install flutter --classic

# 2. Aceitar licenças Android (se for usar Android)
flutter doctor --android-licenses
```

### Preparar o Projeto

```bash
# 1. Ir para o diretório do projeto
cd ~/Documentos/GitHub/karen-hagmayer-wisdom/agenda-estoica-app

# 2. Instalar dependências
flutter pub get

# 3. Gerar código Hive (adaptadores)
flutter pub run build_runner build --delete-conflicting-outputs
```

### Executar o App

#### Para Web (Recomendado para teste rápido):

```bash
flutter config --enable-web
flutter run -d chrome
```

#### Para Linux Desktop:

```bash
flutter config --enable-linux-desktop
flutter run -d linux
```

#### Para Android (Emulador ou Dispositivo):

```bash
# Ver dispositivos disponíveis
flutter devices

# Executar (escolhe automaticamente o dispositivo)
flutter run

# Ou especificar um dispositivo
flutter run -d <device_id>
```

---

## 📱 Comandos Úteis Durante a Execução

Quando o app estiver rodando, você pode usar:

- **`r`** - Hot reload (recarregar código)
- **`R`** - Hot restart (reiniciar app)
- **`h`** - Ver todos os comandos disponíveis
- **`q`** - Sair
- **`p`** - Mostrar grid de debug
- **`o`** - Alternar entre Android e iOS (se ambos estiverem configurados)

---

## 🐛 Troubleshooting

### Erro: "No supported devices connected"

**Solução:**

```bash
# Para web
flutter config --enable-web
flutter run -d chrome

# Para Linux
flutter config --enable-linux-desktop
flutter run -d linux
```

### Erro: "Waiting for another flutter command to release the startup lock"

**Solução:**

```bash
killall -9 dart
rm -rf /tmp/flutter_tools_build_lock_*
```

### Erro: Adaptadores Hive não encontrados

**Solução:**

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Erro: Dependências não instaladas

**Solução:**

```bash
flutter clean
flutter pub get
```

---

## 🎯 Recomendação para Começar

**Opção Mais Rápida (1 minuto):**

```bash
cd ~/Documentos/GitHub/karen-hagmayer-wisdom/agenda-estoica-app
flutter config --enable-web
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run -d chrome
```

Isso abrirá o app diretamente no seu navegador! 🚀

---

## 📸 Screenshot e Gravação

### Tirar screenshot:

```bash
# Durante a execução, pressione 's' no terminal
# Ou use:
flutter screenshot
```

### Gravar vídeo (Android):

```bash
# No terminal separado
adb shell screenrecord /sdcard/demo.mp4

# Para parar: Ctrl+C
# Baixar o vídeo:
adb pull /sdcard/demo.mp4
```

---

## 🔄 Hot Reload

O Flutter suporta **hot reload** - você pode editar o código e ver as mudanças instantaneamente sem reiniciar o app!

1. Execute o app: `flutter run`
2. Edite qualquer arquivo `.dart`
3. Salve o arquivo
4. As mudanças aparecem automaticamente!
5. Ou pressione `r` no terminal

---

**Dica:** Para melhor experiência de desenvolvimento, use VS Code com as extensões Flutter e Dart instaladas!
