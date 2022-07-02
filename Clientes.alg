Algoritmo "Clientes"

// RecodePro 2022
// Disciplina : Módulo 2, Trabalho individual.
// Descrição : Página para cadastrar e consultar dados de clientes cadastrados no site de viagens.
// Autor(a) : Maria Rosemara

Var
   cpf : Vetor[1..5] de Caracter
   nome : Vetor[1..5] de Caracter
   nascimento : Vetor[1..5] de Caracter
   sexo : Vetor[1..5] de Caracter
   Item_cad : Inteiro
   Max_itens : Inteiro
   opcao : Caracter
   X,FLAG,Flag2 : LOGICO

FUNÇÃO PESQUISA(xcpf : caracter): Inteiro

Var
   p_Item, XP : inteiro
   
Inicio
   XP := 0
   PARA p_Item DE 1 ATÉ Max_itens FAÇA
      SE (xcpf = cpf[p_Item]) ENTAO
         XP := p_Item
      FIMSE
   FIMPARA
   RETORNE XP
FIMFUNÇÃO

                        Procedimento Cadastrar  // CADASTRO
Var iFlag : Logico
   iPesq : Inteiro
   xcpf,xnome,xnascimento,xsexo,xRESP: Caracter
   
Inicio
  iFLAG := VERDADEIRO
  Enquanto iFlag FAÇA
      Item_cad := Item_cad + 1
      SE Item_cad > Max_itens ENTÃO
         iFlag := Falso
      SENÃO
         LimpaTela
         Escreval("Cadastrar Clientes")
         Escreval(" ")
         Escreval(" ")
         Escreva("CPF: ")
         Leia(xcpf)
         iPesq := PESQUISA(xcpf)
         SE ((iPesq = 0) E (xcpf <> "0")) ENTÃO
            Escreva("Nome: ")
            Leia(xnome)
            Escreva("Data de nascimento: ")
            Leia(xnascimento)
            Escreva("Sexo: ")
            Leia(xsexo)
            Escreval(" ")

            Escreva("Quer salvar? Digite S para sim e N para não: ")
            Leia(xRESP)
            SE ((xRESP = "S") OU (xRESP = "s")) ENTÃO
               cpf[Item_cad] := xcpf
               nome[Item_cad] := xnome
               nascimento[Item_cad] := xnascimento
               sexo[Item_cad] := xsexo
            SENÃO
               SE Item_cad > 0 ENTÃO
                  Item_cad := Item_cad - 1
               FIMSE
            FIMSE
         SENÃO
            SE (xcpf = "0") ENTÃO
               SE Item_cad > 0 ENTÃO
                  Item_cad := Item_cad - 1
               FIMSE
               iFLAG := Falso
            SENÃO
               Escreval(" ")
               Escreva("CPF já existe no cadastrado !")
               Escreval(" ")
            FIMSE
         FIMSE
      FIMSE
      Escreval(" ")
      Escreval(" ========================= ")
      Escreval(" ")
      Escreva("Cadastrar outro cliente? Digite S para sim e N para não : ")
      Leia(xRESP)
      SE ((xRESP = "N") OU (xRESP = "n")) ENTÃO
         iFlag := FALSO
      SENÃO
         iFlag := VERDADEIRO
      FIMSE
  FIMENQUANTO
FimProcedimento

                        Procedimento Consultar      //CONSULTA
Var cFlag : Logico
   cPesq : Inteiro
   xcpf,xnome,xnascimento,xsexo: Caracter
   
Inicio
   cFlag := VERDADEIRO
   Enquanto cFlag FAÇA
      SE Item_cad < 1 ENTÃO
         cFlag := Falso
      SENÃO
         LimpaTela
         Escreval("Consulta de dados pelo CPF.")
         Escreval(" ")
         Escreval(" ")
         Escreva("Digite o CPF do cliente: ")
         Leia(xcpf)
         SE (xcpf = "0") ENTÃO
            cFLAG := Falso
         SENÃO
            cPesq := PESQUISA(xcpf)
            SE cPesq > 0 ENTÃO
               xnome := nome[cPESQ]
               xnascimento := nascimento[cPESQ]
               xsexo := sexo[cPESQ]
               EscrevaL("Nome: ",xnome)
               EscrevaL("Data de nascimento: ",xnascimento)
               EscrevaL("Sexo: ",xsexo)
               Escreval(" ")
               Escreva("Para consultar dados de outro cliente tecle <<ENTER>> ")
               Escreval(" ")
               Escreval(" ")
               Escreva("Para finalizar as consultas tecle <<ENTER>>, em seguida digite o número 0 e tecle <<ENTER>> novamente.")
               LEIA(X)
            SENÃO
               EscrevaL(" ")
               EscrevaL(" ")
               EscrevaL(" ")
               EscrevaL("CPF não existe no cadastro!")
               Escreva("Tecle <enter> para continuar. ")
               LEIA(X)
            FIMSE
         FIMSE
      FIMSE
   FIMENQUANTO
FimProcedimento

                   // INICIO DO PROGRAMA

inicio
   Max_itens := 3
   X := VERDADEIRO
   FLAG := VERDADEIRO
   Item_cad := 0
   ENQUANTO FLAG FAÇA
      X := VERDADEIRO
   MUDACOR("Vermelho","FRENTE")
   limpatela
     Escreval("*** Menu ***")
     Escreval("1 - Cadastrar Clientes")
     Escreval("2 - Consulta Clientes")
     Escreval("3 - Finalizar")
     Escreval("  ")
     Escreva("Digite o número da opção desejada:")
   Leia(opcao)
   SE ((opcao > "0") E (opcao < "4")) ENTÃO
      Escolha opcao
      Caso "1"
         Cadastrar
      Caso "2"
         Consultar
      Caso "3"
         FLAG := FALSO
      Fimescolha
   SENÃO
      Escreval("Opção inválida")
      Escreva("Tecle <enter> para tentar novamente.")
      LEIA(X)
   FIMSE
   FIMENQUANTO

fimalgoritmo