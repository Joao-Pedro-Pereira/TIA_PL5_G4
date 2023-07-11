% sistema de inferencia A simple backward chaining rule interpreter
:- op( 800, fx, if).
:- op( 700, xfx, then).
:- op( 300, xfy, or).
:- op( 200, xfy, and).

:- dynamic(fact/1).
if custo_alto and o_braga then carro.
if custo_alto and o_coimbra then autocarro.
if custo_alto and o_faro then carro.
if custo_alto and o_guimaraes then carro.
if custo_alto and o_lisboa then carro.
if custo_alto and o_porto then carro.
if custo_alto and o_viseu then carro.
if custo_medio and o_braga then comboio.
if custo_medio and o_chaves then carro.
if custo_medio and o_faro then comboio.
if custo_medio and o_guimaraes then carro.
if custo_medio and o_lisboa then comboio.
if custo_medio and o_porto then comboio.
if custo_medio and o_viseu then carro.
if custo_baixo and o_braga then autocarro.
if custo_baixo and o_chaves then autocarro.
if custo_baixo and o_coimbra then autocarro.
if custo_baixo and o_faro then autocarro.
if custo_baixo and o_guimaraes then carro.
if custo_baixo and o_lisboa then autocarro.
if custo_baixo and o_porto then autocarro.
