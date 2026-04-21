-- CreateTable
CREATE TABLE "Usuario" (
    "id_usuario" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "nivel_acesso" TEXT NOT NULL DEFAULT 'USER',
    "data_criacao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id_usuario")
);

-- CreateTable
CREATE TABLE "Conta" (
    "id_conta" SERIAL NOT NULL,
    "numero_conta" TEXT NOT NULL,
    "saldo" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "id_usuario" INTEGER NOT NULL,
    "data_conta_criada" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Conta_pkey" PRIMARY KEY ("id_conta")
);

-- CreateTable
CREATE TABLE "Transacao" (
    "id_transacao" SERIAL NOT NULL,
    "tipo" TEXT NOT NULL,
    "valor" DECIMAL(65,30) NOT NULL,
    "conta_origem_id" INTEGER NOT NULL,
    "conta_destino_id" INTEGER,
    "data_transacao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Transacao_pkey" PRIMARY KEY ("id_transacao")
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_email_key" ON "Usuario"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Conta_numero_conta_key" ON "Conta"("numero_conta");

-- AddForeignKey
ALTER TABLE "Conta" ADD CONSTRAINT "Conta_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "Usuario"("id_usuario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transacao" ADD CONSTRAINT "Transacao_conta_origem_id_fkey" FOREIGN KEY ("conta_origem_id") REFERENCES "Conta"("id_conta") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transacao" ADD CONSTRAINT "Transacao_conta_destino_id_fkey" FOREIGN KEY ("conta_destino_id") REFERENCES "Conta"("id_conta") ON DELETE SET NULL ON UPDATE CASCADE;
