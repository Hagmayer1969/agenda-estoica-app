# Agenda Estóica 2026 📅

Um aplicativo de planejamento diário inspirado na filosofia estoica, desenvolvido com Flutter. Organize suas tarefas, gerencie eventos no calendário e inspire-se com citações dos grandes filósofos estoicos.

## ✨ Funcionalidades

### 📝 Gerenciamento de Tarefas

- Crie, edite e exclua tarefas
- Defina prioridades (Baixa, Média, Alta)
- Adicione descrições e reflexões estóicas
- Organize com tags personalizadas
- Defina datas de vencimento
- Acompanhe o progresso com indicadores visuais
- Filtre por status (todas, pendentes, concluídas)

### 📆 Calendário Integrado

- Visualize eventos em formato de calendário mensal
- Adicione eventos com hora de início e término
- Suporte para eventos de dia inteiro
- Adicione localização aos eventos
- Configure lembretes personalizados
- Associe princípios estóicos aos eventos

### 💬 Citações Estóicas

- Citação diária inspiradora
- Biblioteca com 20+ citações de Marco Aurélio, Epicteto e Sêneca
- Marque citações como favoritas
- Compartilhe citações via redes sociais
- Organize por temas (coragem, aceitação, virtude, etc.)

### 🔔 Notificações

- Lembretes para tarefas e eventos
- Notificação diária com citação estóica
- Configuração flexível de horários

### 🎨 Interface Moderna

- Design Material 3
- Tema claro e escuro automático
- Animações fluidas
- Interface intuitiva e responsiva
- Suporte para deslizar para ações rápidas

## 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework multiplataforma
- **Provider**: Gerenciamento de estado
- **Hive**: Banco de dados local NoSQL
- **Table Calendar**: Widget de calendário
- **Flutter Local Notifications**: Sistema de notificações
- **Google Fonts**: Tipografia Lato
- **Intl**: Internacionalização e formatação de datas
- **Share Plus**: Compartilhamento de conteúdo
- **Flutter Slidable**: Ações de deslizar

## 📋 Pré-requisitos

- Flutter SDK >= 3.0.0
- Dart SDK >= 3.0.0
- Android Studio / VS Code
- Dispositivo físico ou emulador Android/iOS

## 🚀 Instalação e Configuração

### 1. Clone o repositório

```bash
git clone https://github.com/Hagmayer1969/agenda-estoica-app.git
cd agenda-estoica-app
```

### 2. Instale as dependências

```bash
flutter pub get
```

### 3. Configure os assets

#### Fontes Lato

1. Baixe a fonte Lato do [Google Fonts](https://fonts.google.com/specimen/Lato)
2. Coloque os arquivos na pasta `assets/fonts/`:
   - Lato-Regular.ttf
   - Lato-Bold.ttf
   - Lato-Italic.ttf

#### Ícone do Aplicativo

- Adicione seu ícone personalizado em `assets/images/`
- Use o pacote `flutter_launcher_icons` para gerar ícones para todas as plataformas

### 4. Gere os adaptadores Hive

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 5. Configure as permissões

#### Android (`android/app/src/main/AndroidManifest.xml`)

```xml
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
<uses-permission android:name="android.permission.VIBRATE" />
<uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM"/>
<uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
<uses-permission android:name="android.permission.READ_CALENDAR" />
<uses-permission android:name="android.permission.WRITE_CALENDAR" />
```

#### iOS (`ios/Runner/Info.plist`)

```xml
<key>NSCalendarsUsageDescription</key>
<string>Este app precisa acessar seu calendário para gerenciar eventos.</string>
<key>NSRemindersUsageDescription</key>
<string>Este app precisa acessar seus lembretes.</string>
```

### 6. Execute o aplicativo

```bash
flutter run
```

## 📱 Estrutura do Projeto

```
lib/
├── main.dart                 # Ponto de entrada do app
├── models/                   # Modelos de dados
│   ├── task.dart            # Modelo de tarefa
│   ├── event.dart           # Modelo de evento
│   └── stoic_quote.dart     # Modelo de citação
├── providers/               # Gerenciadores de estado
│   ├── task_provider.dart   # Provider de tarefas
│   ├── event_provider.dart  # Provider de eventos
│   └── quote_provider.dart  # Provider de citações
├── screens/                 # Telas do aplicativo
│   ├── home_screen.dart     # Tela inicial
│   ├── calendar_screen.dart # Tela de calendário
│   ├── task_list_screen.dart # Lista de tarefas
│   └── quote_screen.dart    # Biblioteca de citações
├── services/                # Serviços
│   └── notification_service.dart # Gerenciamento de notificações
└── widgets/                 # Widgets personalizados

assets/
├── data/
│   └── stoic_quotes.json    # Base de citações estóicas
├── fonts/                   # Fontes customizadas
└── images/                  # Recursos visuais
```

## 🎯 Próximos Passos

- [ ] Implementar diálogos de adicionar/editar tarefas
- [ ] Implementar diálogos de adicionar/editar eventos
- [ ] Adicionar sincronização com Google Calendar
- [ ] Implementar sistema de backup e restauração
- [ ] Adicionar estatísticas e gráficos de produtividade
- [ ] Criar widget para tela inicial do sistema
- [ ] Adicionar modo de foco/Pomodoro
- [ ] Implementar diário estóico
- [ ] Adicionar mais citações e autores
- [ ] Suporte para múltiplos idiomas

## 🧘 Filosofia Estóica

Este aplicativo é inspirado nos princípios do estoicismo:

- **Controle**: Foque no que você pode controlar
- **Virtude**: Viva de acordo com seus valores
- **Natureza**: Aceite o que não pode mudar
- **Razão**: Use a lógica para guiar suas ações
- **Momento Presente**: Viva no agora

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 👤 Autor

**Karen Hagmayer**

- GitHub: [@Hagmayer1969](https://github.com/Hagmayer1969)

## 🤝 Contribuindo

Contribuições, issues e feature requests são bem-vindos!

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 🙏 Agradecimentos

- Citações dos grandes filósofos estoicos: Marco Aurélio, Epicteto e Sêneca
- Comunidade Flutter pela excelente documentação
- Todos os contribuidores de pacotes open-source utilizados

---

_"Você tem poder sobre sua mente - não sobre eventos externos. Perceba isso, e você encontrará força."_ - Marco Aurélio
