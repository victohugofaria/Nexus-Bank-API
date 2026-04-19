const express = require("express");
const app = express();

// Permite que a API leia JSON
app.use(express.json());

// Rota para teste
app.get("/", (req, res) => {
  res.json({ message: "Nexus Bank API rodando!" });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
