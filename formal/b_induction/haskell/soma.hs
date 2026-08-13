{-
    Objetivo:
    Representar em Haskell a definição recursiva da soma baseada nos axiomas de Peano.

    Definição:
        m + 0   = m
        m + S(n) = S(m + n)

    Construção dos números naturais (Currying):

        0 = Zero
        1 = S Zero
        2 = S (S Zero)
        3 = S (S (S Zero))
        ...

    Onde S:N -> N representa a função sucessor:
        S(n) = n + 1
-}


{-
    Tipo dos números naturais

    Um Nat é:
      Zero     -> o número 0
      S Nat    -> o sucessor de um número natural
-}
data Nat = Zero | S Nat deriving Show

{-

    Conversão de Int para Nat

    Converte um número inteiro não negativo para a representação
    recursiva dos naturais.

    Exemplos:

      nat 0 = Zero
      nat 1 = S Zero
      nat 2 = S (S Zero)
      nat 3 = S (S (S Zero))
      ...

    Essa função existe apenas para facilitar os testes, evitando
    escrever manualmente a sequência de sucessores no main.
-}
nat :: Int -> Nat
nat 0 = Zero
nat n = S (nat (n - 1))


{-
    A função soma recebe um Nat e devolve uma função que recebe
    outro Nat. Isso ocorre porque funções em Haskell são curried.

    Portanto:
        soma :: Nat -> Nat -> Nat
    
    é equivalente a:
        soma :: Nat -> (Nat -> Nat)
    
    Definição matemática:
        m + 0   = m
        m + S(n) = S(m + n)

    Tradução direta para Haskell:
-}
soma :: Nat -> (Nat -> Nat)
soma m Zero   = m
soma m (S n)  = S (soma m n)


{-
    A função IO() 'main' é uma função impura (e imunda) e apenas exibe o resultado no terminal. 
    Não faz parte da definição matemática da soma. Despreze a gentalha
-}
main :: IO()
main = print (soma (nat 3) (nat 7))
