# 🎨 GRUB Theme Engine

Um **CLI tool open-source moderno** para criação, personalização e instalação de temas para o GRUB (bootloader Linux).

Projetado com arquitetura modular, pronto para evolução em:
- 🧠 CLI profissional tipo npm/apt
- 🌐 Marketplace de temas via GitHub API
- ⚡ Sistema de preview com virtualização (QEMU)

---

# 🧭 Visão

Este projeto transforma a experiência de personalização do GRUB em algo simples:

> Um comando. Um tema. Um sistema.

```bash
grub-theme install windows-vista
````

---

# 🚀 Features

* ⚡ Instalação de temas via CLI
* 🎨 Sistema de customização dinâmica (placeholders)
* 👀 Preview de temas em ambiente isolado (QEMU)
* 🧩 Arquitetura modular (core + cli + themes)
* 🔒 Manipulação segura do GRUB com backup automático
* 🌐 Preparado para integração com GitHub API (registry futuro)

---

# 📦 Temas disponíveis

| Tema                | Estilo                      |
| ------------------- | --------------------------- |
| 🟦 windows-vista    | Glass / Windows Vista style |
| 💧 liquid-glass     | Glassmorphism futurista     |
| 🌑 minimalist-dark  | UI escura e minimalista     |
| 🌕 minimalist-light | UI clara e clean            |
| 🟢 matrix-morpheus  | Hacker / Matrix aesthetic   |

---

# ⚙️ Instalação

```bash
git clone https://github.com/laiscoutinho/grub-themes.git
cd grub-themes
chmod +x grub-theme.sh
```

---

# 🧠 CLI (modo atual)

## 📌 Estrutura de comando

```bash
./grub-theme.sh <command> [theme]
```

---

## 🚀 Instalar tema

```bash
./grub-theme.sh install windows-vista
```

---

## 👀 Preview de tema (sandbox)

```bash
./grub-theme.sh preview windows-vista
```

---

## ❌ Remover tema

```bash
./grub-theme.sh remove windows-vista
```

---

## 📋 Listar temas

```bash
./grub-theme.sh list
```

---

## ℹ️ Informações do tema

```bash
./grub-theme.sh info windows-vista
```

---

# 🧱 Arquitetura

```text
core/        → engine do sistema (installer, loader, preview, ui)
cli/         → comandos do usuário (install, preview, remove, etc)
themes/      → temas isolados e portáveis
preview/     → ambiente de teste com ISO + QEMU
grub-theme.sh → entrypoint (router CLI)
```

---

# 🎨 Estrutura de um tema

Cada tema segue o padrão:

```text
themes/windows-vista/
├── theme.txt
├── config.json
├── assets/
│   ├── background.png
│   └── icons/
└── preview.png (opcional)
```

---

# 🧠 config.json (padrão)

```json
{
  "id": "windows-vista",
  "name": "Windows Vista Basic",
  "version": "1.0.0",
  "description": "Tema estilo Windows Vista para GRUB",
  "author": "laiscoutinho",

  "customizable": [
    {
      "field": "username",
      "placeholder": "{{USERNAME}}",
      "label": "Nome exibido",
      "type": "text",
      "required": false,
      "default": "User"
    }
  ]
}
```

---

# ⚡ Sistema de customização

O engine substitui automaticamente placeholders como:

```text
{{USERNAME}}
```

Durante a instalação.

---

# 👀 Preview system

O sistema gera um ambiente isolado:

* ISO temporária
* GRUB simulado
* execução via QEMU

```bash
grub-theme preview windows-vista
```

---

# 🛡️ Segurança

* Backup automático do `/etc/default/grub`
* Sem execução de código externo
* Alterações apenas locais
* Reversão de temas suportada

---

# 🌐 Futuro (Roadmap)

## 🧠 curto prazo

* CLI final (grub-theme global command)
* JSON output (`--json`)
* sistema de versionamento de temas

## 🌍 médio prazo

* GitHub Theme Registry
* download remoto de temas

## 🛍️ longo prazo

* marketplace web
* preview online
* install via one-click CLI

---

# 🤝 Contribuição

Para criar um tema:

1. Crie pasta em `themes/`
2. Adicione `theme.txt` e `config.json`
3. Inclua assets
4. Submeta PR

---

# 📄 Licença

MIT License

---

# ⭐ Objetivo

Este projeto evolui para:

> 🧠 um ecossistema de temas para bootloader Linux com CLI + API + marketplace

---

# 🚀 Comando principal

```bash
grub-theme install <theme>
```

Simples. Escalável. Futurista.
