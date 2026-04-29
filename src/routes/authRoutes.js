// Define as rotas públicas de autenticação (cadastro e login)

const express = require("express");
const router = express.Router();
const authController = require("../control/authController");

// Rota para cadastrar um novo usuário
router.post("/register", authController.register);

// Rota para realizar login e receber o token JWT
router.post("/login", authController.login);

module.exports = router;
