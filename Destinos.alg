Algoritmo "Destinos"

// RecodePro 2022
// Disciplina : M�dulo 2, Trabalho individual.
// Descri��o : P�gina para cadastrar e consultar dados dos destinhos cadastrados no site de viagens.
// Autor(a) : Maria Rosemara

Var
   cnpj : Vetor[1..5] de Caracter
   local : Vetor[1..5] de Caracter
   telefone : Vetor[1..5] de Caracter
   valor : Vetor[1..5] de Caracter
   Item_cad : Inteiro
   Max_itens : Inteiro
   opcao : Caracter
   X,FLAG,Flag2 : LOGICO

FUN��O PESQUISA(xcnpj : caracter): Inteiro

Var
   p_Item, XP : inteiro

Inicio
   XP := 0
   PARA p_Item DE 1 AT� Max_itens FA�A
      SE (xcnpj = cnpj[p_Item]) ENTAO
         XP := p_Item
      FIMSE
   FIMPARA
   RETORNE XP
FIMFUN��O

                        Procedimento Cadastrar  // CADASTRO
Var iFlag : Logico
   iPesq : Inteiro
   xcnpj,xlocal,xtelefone,xvalor,xRESP: Caracter

Inicio
  iFLAG := VERDADEIRO
  Enquanto iFlag FA�A
      Item_cad := Item_cad + 1
      SE Item_cad > Max_itens ENT�O
         iFlag := Falso
      SEN�O
         LimpaTela
         Escreval("Cadastrar Destino")
         Escreval(" ")
         Escreval(" ")
         Escreva("CNPJ: ")
         Leia(xcnpj)
         iPesq := PESQUISA(xcnpj)
         SE ((iPesq = 0) E (xcnpj <> "0")) ENT�O
            Escreva("Nome do destino que deseja cadastrar: ")
            Leia(xlocal)
            Escreva("Telefone para contato: ")
            Leia(xtelefone)
            Escreva("Pre�o do pacote para viagem: ")
            Leia(xvalor)
            Escreval(" ")

            Escreva("Quer salvar? Digite S para sim e N para n�o: ")
            Leia(xRESP)
            SE ((xRESP = "S") OU (xRESP = "s")) ENT�O
               cnpj[Item_cad] := xcnpj
               local[Item_cad] := xlocal
               telefone[Item_cad] := xtelefone
               valor[Item_cad] := xvalor
            SEN�O
               SE Item_cad > 0 ENT�O
                  Item_cad := Item_cad - 1
               FIMSE
            FIMSE
         SEN�O
            SE (xcnpj = "0") ENT�O
               SE Item_cad > 0 ENT�O
                  Item_cad := Item_cad - 1
               FIMSE
               iFLAG := Falso
            SEN�O
               Escreval(" ")
               Escreva("CNPJ j� existe no cadastrado !")
               Escreval(" ")
            FIMSE
         FIMSE
      FIMSE
      Escreval(" ")
      Escreval(" ========================= ")
      Escreval(" ")
      Escreva("Cadastrar outro destino? Digite S para sim e N para n�o : ")
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
   xcnpj,xlocal,xtelefone,xvalor: Caracter

Inicio
   cFlag := VERDADEIRO
   Enquanto cFlag FA�A
      SE Item_cad < 1 ENT�O
         cFlag := Falso
      SEN�O
         LimpaTela
         Escreval("Consulta de dados pelo CNPJ.")
         Escreval(" ")
         Escreval(" ")
         Escreva("Digite o CNPJ: ")
         Leia(xcnpj)
         SE (xcnpj = "0") ENT�O
            cFLAG := Falso
         SEN�O
            cPesq := PESQUISA(xcnpj)
            SE cPesq > 0 ENT�O
               xlocal := local[cPESQ]
               xtelefone := telefone[cPESQ]
               xvalor := valor[cPESQ]
               EscrevaL("Nome do destino cadastrado: ",xlocal)
               EscrevaL("Telefone de contato: ",xtelefone)
               EscrevaL("Pre�o do pacote: ",xvalor)
               Escreval(" ")
               Escreva("Para consultar dados de outro destino tecle <<ENTER>> ")
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
     Escreval("1 - Cadastrar Destinos")
     Escreval("2 - Consultar Destinos")
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