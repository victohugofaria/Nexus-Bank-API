// Arquivo principal da aplicação — inicializa o servidor Express

const express = require("express");
const app = express();

// Permite que a API leia JSON no corpo das requisições
app.use(express.json());

// Rota de teste para confirmar que o servidor está no ar
app.get("/", (req, res) => {
  res.json({ message: "Nexus Bank API rodando!" });
});

// Define a porta a partir do .env ou usa 3000 como padrão
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
