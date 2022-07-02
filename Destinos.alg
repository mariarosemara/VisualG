Algoritmo "Destinos"

// RecodePro 2022
// Disciplina : Módulo 2, Trabalho individual.
// Descrição : Página para cadastrar e consultar dados dos destinhos cadastrados no site de viagens.
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

FUNÇÃO PESQUISA(xcnpj : caracter): Inteiro

Var
   p_Item, XP : inteiro

Inicio
   XP := 0
   PARA p_Item DE 1 ATÉ Max_itens FAÇA
      SE (xcnpj = cnpj[p_Item]) ENTAO
         XP := p_Item
      FIMSE
   FIMPARA
   RETORNE XP
FIMFUNÇÃO

                        Procedimento Cadastrar  // CADASTRO
Var iFlag : Logico
   iPesq : Inteiro
   xcnpj,xlocal,xtelefone,xvalor,xRESP: Caracter

Inicio
  iFLAG := VERDADEIRO
  Enquanto iFlag FAÇA
      Item_cad := Item_cad + 1
      SE Item_cad > Max_itens ENTÃO
         iFlag := Falso
      SENÃO
         LimpaTela
         Escreval("Cadastrar Destino")
         Escreval(" ")
         Escreval(" ")
         Escreva("CNPJ: ")
         Leia(xcnpj)
         iPesq := PESQUISA(xcnpj)
         SE ((iPesq = 0) E (xcnpj <> "0")) ENTÃO
            Escreva("Nome do destino que deseja cadastrar: ")
            Leia(xlocal)
            Escreva("Telefone para contato: ")
            Leia(xtelefone)
            Escreva("Preço do pacote para viagem: ")
            Leia(xvalor)
            Escreval(" ")

            Escreva("Quer salvar? Digite S para sim e N para não: ")
            Leia(xRESP)
            SE ((xRESP = "S") OU (xRESP = "s")) ENTÃO
               cnpj[Item_cad] := xcnpj
               local[Item_cad] := xlocal
               telefone[Item_cad] := xtelefone
               valor[Item_cad] := xvalor
            SENÃO
               SE Item_cad > 0 ENTÃO
                  Item_cad := Item_cad - 1
               FIMSE
            FIMSE
         SENÃO
            SE (xcnpj = "0") ENTÃO
               SE Item_cad > 0 ENTÃO
                  Item_cad := Item_cad - 1
               FIMSE
               iFLAG := Falso
            SENÃO
               Escreval(" ")
               Escreva("CNPJ já existe no cadastrado !")
               Escreval(" ")
            FIMSE
         FIMSE
      FIMSE
      Escreval(" ")
      Escreval(" ========================= ")
      Escreval(" ")
      Escreva("Cadastrar outro destino? Digite S para sim e N para não : ")
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
   xcnpj,xlocal,xtelefone,xvalor: Caracter

Inicio
   cFlag := VERDADEIRO
   Enquanto cFlag FAÇA
      SE Item_cad < 1 ENTÃO
         cFlag := Falso
      SENÃO
         LimpaTela
         Escreval("Consulta de dados pelo CNPJ.")
         Escreval(" ")
         Escreval(" ")
         Escreva("Digite o CNPJ: ")
         Leia(xcnpj)
         SE (xcnpj = "0") ENTÃO
            cFLAG := Falso
         SENÃO
            cPesq := PESQUISA(xcnpj)
            SE cPesq > 0 ENTÃO
               xlocal := local[cPESQ]
               xtelefone := telefone[cPESQ]
               xvalor := valor[cPESQ]
               EscrevaL("Nome do destino cadastrado: ",xlocal)
               EscrevaL("Telefone de contato: ",xtelefone)
               EscrevaL("Preço do pacote: ",xvalor)
               Escreval(" ")
               Escreva("Para consultar dados de outro destino tecle <<ENTER>> ")
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
     Escreval("1 - Cadastrar Destinos")
     Escreval("2 - Consultar Destinos")
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