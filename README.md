# Plataforma de Assinatura Digital

Uma aplicação web para gerenciar o processo de assinatura digital de documentos.

## 🚀 Como usar

### Método 1: Abrir diretamente no navegador
1. Abra o arquivo `index.html` em qualquer navegador web moderno
2. A aplicação irá carregar automaticamente

### Método 2: Servidor local (Python)
```bash
# Execute no diretório do projeto
python3 -m http.server 8000
# Acesse: http://localhost:8000
```

### Método 3: Servidor local (Node.js)
```bash
# Instale as dependências
npm install
# Execute o servidor
npm start
# Acesse: http://localhost:8000
```

## 📋 Funcionalidades

1. **Upload de Documento**: Faça upload do documento que precisa ser assinado
2. **Gerenciar Signatários**: Adicione os emails dos signatários envolvidos
3. **Envio Seguro**: Simula o envio seguro do documento por email
4. **Assinatura Digital**: Interface para cada signatário assinar o documento
5. **Download Final**: Baixe o documento final com todas as assinaturas

## 🛠️ Tecnologias

- **Vue.js 3**: Framework JavaScript para interface reativa
- **HTML5**: Estrutura da aplicação
- **CSS3**: Estilização e layout responsivo
- **JavaScript ES6+**: Lógica da aplicação

## 📁 Estrutura do Projeto

```
├── index.html              # Página principal da aplicação
├── src/
│   └── DocumentSignPlatform.vue  # Componente Vue original
├── package.json            # Configurações do projeto
└── README.md              # Este arquivo
```

## 🌐 Deploy

Esta aplicação pode ser facilmente hospedada em qualquer serviço de hospedagem estática:

- **GitHub Pages**: Ative nas configurações do repositório
- **Netlify**: Faça deploy direto do repositório
- **Vercel**: Deploy automático via GitHub
- **Qualquer servidor web**: Hospede os arquivos em qualquer servidor HTTP

## 📝 Notas

- Esta é uma versão de demonstração que simula o processo de assinatura digital
- Para uso em produção, implemente um backend real para processamento de PDFs e autenticação
- O "PDF" gerado é apenas um arquivo de texto simulado para demonstração