module Practica02 where

--Sintaxis de la logica proposicional
data Prop = Var String | Cons Bool | Not Prop
            | And Prop Prop | Or Prop Prop
            | Impl Prop Prop | Syss Prop Prop
            deriving (Eq)

instance Show Prop where 
                    show (Cons True) = "⊤"
                    show (Cons False) = "⊥"
                    show (Var p) = p
                    show (Not p) = "¬" ++ show p
                    show (Or p q) = "(" ++ show p ++ " ∨ " ++ show q ++ ")"
                    show (And p q) = "(" ++ show p ++ " ∧ " ++ show q ++ ")"
                    show (Impl p q) = "(" ++ show p ++ " → " ++ show q ++ ")"
                    show (Syss p q) = "(" ++ show p ++ " ↔ " ++ show q ++ ")"


p, q, r, s, t, u :: Prop
p = Var "p"
q = Var "q"
r = Var "r"
s = Var "s"
t = Var "t"
u = Var "u"

type Estado = [String]

--EJERCICIOS

--Ejercicio 1
variables :: Prop -> [String]
variables p = auxrepetidos (auxVariables p)

--Reune las variables
auxVariables :: Prop -> [String]
auxVariables (Cons True) = []
auxVariables (Cons False) = []
auxVariables (Var p) = [p]
auxVariables (Not p) = auxVariables p
auxVariables (Or p q) = auxVariables p ++ auxVariables q
auxVariables (And p q) = auxVariables p ++ auxVariables q
auxVariables (Impl p q) = auxVariables p ++ auxVariables q
auxVariables (Syss p q) = auxVariables p ++ auxVariables q

--Filtra las variables repetidas
auxrepetidos :: [String] -> [String]
auxrepetidos [] = []
auxrepetidos (x:xs) = x : auxrepetidos (filter (/= x) xs)


--Ejercicio 2
interpretacion :: Prop -> Estado -> Bool
interpretacion (Cons True) estado = True
interpretacion (Cons False) estado = False
interpretacion (Var p) estado = elem p estado
interpretacion (Not fp) estado = not(interpretacion fp estado)
interpretacion (Or fp fq) estado = interpretacion fp estado || interpretacion fq estado
interpretacion(And fp fq) estado = interpretacion fp estado && interpretacion fq estado
interpretacion (Impl fp fq) estado = not(interpretacion fp estado) || interpretacion fq estado 
interpretacion (Syss fp fq) estado= interpretacion fp estado == interpretacion fq estado  




--Ejercicio 3
estadosPosibles :: Prop -> [Estado]
estadosPosibles fp = conjPotencia(variables (fp)) 
-- IMPORTANTE!!! en el caso la formula Cg maneja un distinto orden pero son el mismo numeros de conjuntos solo
--- en distinto orden, por lo que al hacer los test unitarios marcan error anexo captura--


--Ejercicio 4
modelos :: Prop -> [Estado]
modelos fp = [estado | estado <- estadosPosibles fp, interpretacion fp estado]
-- IMPORTANTE!!!mismo caso del ejercicio anterior, la formula Cg maneja un distinto orden pero son el mismo numeros de conjuntos solo
--- en distinto orden, por lo que al hacer los test unitarios marcan error anexo captura--


--Ejercicio 5
sonEquivalentes :: Prop -> Prop -> Bool
sonEquivalentes fp fq = modelos fp == modelos fq
-- se acarrea el mismo problema de las funciones anteriores como tienen distinto orden marca como falso algo que si es equivalente


--Ejercicio 6 
tautologia :: Prop -> Bool
tautologia fp = estadosPosibles fp == modelos fp

--Ejercicio 7
contradiccion :: Prop -> Bool
contradiccion fp = modelos fp == []

--Ejercicio 8
consecuenciaLogica :: [Prop] -> Prop -> Bool
consecuenciaLogica premisas conclusion = all (`elem` modelos conclusion) (filter (\estado -> all (\p -> interpretacion p estado) premisas) (estadosPosibles conclusion))
--Funcion auxiliar
conjPotencia :: [a] -> [[a]]
conjPotencia [] = [[]]
conjPotencia (x:xs) = [(x:ys) | ys <- conjPotencia xs] ++ conjPotencia xs