Algoritmo "Clientes"

// RecodePro 2022
// Disciplina : M�dulo 2, Trabalho individual.
// Descri��o : P�gina para cadastrar e consultar dados de clientes cadastrados no site de viagens.
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

FUN��O PESQUISA(xcpf : caracter): Inteiro

Var
   p_Item, XP : inteiro
   
Inicio
   XP := 0
   PARA p_Item DE 1 AT� Max_itens FA�A
      SE (xcpf = cpf[p_Item]) ENTAO
         XP := p_Item
      FIMSE
   FIMPARA
   RETORNE XP
FIMFUN��O

                        Procedimento Cadastrar  // CADASTRO
Var iFlag : Logico
   iPesq : Inteiro
   xcpf,xnome,xnascimento,xsexo,xRESP: Caracter
   
Inicio
  iFLAG := VERDADEIRO
  Enquanto iFlag FA�A
      Item_cad := Item_cad + 1
      SE Item_cad > Max_itens ENT�O
         iFlag := Falso
      SEN�O
         LimpaTela
         Escreval("Cadastrar Clientes")
         Escreval(" ")
         Escreval(" ")
         Escreva("CPF: ")
         Leia(xcpf)
         iPesq := PESQUISA(xcpf)
         SE ((iPesq = 0) E (xcpf <> "0")) ENT�O
            Escreva("Nome: ")
            Leia(xnome)
            Escreva("Data de nascimento: ")
            Leia(xnascimento)
            Escreva("Sexo: ")
            Leia(xsexo)
            Escreval(" ")

            Escreva("Quer salvar? Digite S para sim e N para n�o: ")
            Leia(xRESP)
            SE ((xRESP = "S") OU (xRESP = "s")) ENT�O
               cpf[Item_cad] := xcpf
               nome[Item_cad] := xnome
               nascimento[Item_cad] := xnascimento
               sexo[Item_cad] := xsexo
            SEN�O
               SE Item_cad > 0 ENT�O
                  Item_cad := Item_cad - 1
               FIMSE
            FIMSE
         SEN�O
            SE (xcpf = "0") ENT�O
               SE Item_cad > 0 ENT�O
                  Item_cad := Item_cad - 1
               FIMSE
               iFLAG := Falso
            SEN�O
               Escreval(" ")
               Escreva("CPF j� existe no cadastrado !")
               Escreval(" ")
            FIMSE
         FIMSE
      FIMSE
      Escreval(" ")
      Escreval(" ========================= ")
      Escreval(" ")
      Escreva("Cadastrar outro cliente? Digite S para sim e N para n�o : ")
      Leia(xRESP)
      SE ((xRESP = "N") OU (xRESP = "n")) ENT�O
         iFlag := FALSO
      SEN�O
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
   Enquanto cFlag FA�A
      SE Item_cad < 1 ENT�O
         cFlag := Falso
      SEN�O
         LimpaTela
         Escreval("Consulta de dados pelo CPF.")
         Escreval(" ")
         Escreval(" ")
         Escreva("Digite o CPF do cliente: ")
         Leia(xcpf)
         SE (xcpf = "0") ENT�O
            cFLAG := Falso
         SEN�O
            cPesq := PESQUISA(xcpf)
            SE cPesq > 0 ENT�O
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
               Escreva("Para finalizar as consultas tecle <<ENTER>>, em seguida digite o n�mero 0 e tecle <<ENTER>> novamente.")
               LEIA(X)
            SEN�O
               EscrevaL(" ")
               EscrevaL(" ")
               EscrevaL(" ")
               EscrevaL("CPF n�o existe no cadastro!")
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
   ENQUANTO FLAG FA�A
      X := VERDADEIRO
   MUDACOR("Vermelho","FRENTE")
   limpatela
     Escreval("*** Menu ***")
     Escreval("1 - Cadastrar Clientes")
     Escreval("2 - Consulta Clientes")
     Escreval("3 - Finalizar")
     Escreval("  ")
     Escreva("Digite o n�mero da op��o desejada:")
   Leia(opcao)
   SE ((opcao > "0") E (opcao < "4")) ENT�O
      Escolha opcao
      Caso "1"
         Cadastrar
      Caso "2"
         Consultar
      Caso "3"
         FLAG := FALSO
      Fimescolha
   SEN�O
      Escreval("Op��o inv�lida")
      Escreva("Tecle <enter> para tentar novamente.")
      LEIA(X)
   FIMSE
   FIMENQUANTO

fimalgoritmo