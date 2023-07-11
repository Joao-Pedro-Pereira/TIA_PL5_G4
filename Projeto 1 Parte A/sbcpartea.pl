% sistema de inferencia A simple backward chaining rule interpreter
:- op( 800, fx, if).
:- op( 700, xfx, then).
:- op( 300, xfy, or).
:- op( 200, xfy, and).

:- dynamic(fact/1).
if jovem and estudante then custo_baixo.
if jovem and trabalhador then custo_alto.
if adulto and estudante then custo_medio.
if adulto and trabalhador then custo_alto.
if adulto and desempregado then custo_baixo.
if idoso and trabalhador then custo_alto.
if idoso and reformado then custo_baixo.

if coimbra and faro then distancia_alta.
if coimbra and braga then distancia_alta.
if coimbra and guimaraes then distancia_alta.
if coimbra and porto then distancia_media.
if coimbra and viseu then distancia_media.

if chaves and braga then distancia_media.
if chaves and guimaraes then distancia_media.
if chaves and porto then distancia_alta.
if chaves and faro then distancia_alta.

if braga and guimaraes then distancia_baixa.
if braga and porto then distancia_baixa.
if braga and guimaraes then distancia_baixa.
if braga and lisboa then distancia_alta.
if braga and faro then distancia_alta.
if braga and chaves then distancia_media.
if braga and viseu then distancia_alta.
if braga and coimbra then distancia_alta.

if porto and viseu then distancia_baixa.
if porto and guimaraes then distancia_baixa.
if porto and lisboa then distancia_alta.
if porto and faro then distancia_alta.
if porto and coimbra then distancia_media.
if porto and chaves then distancia_baixa.

if lisboa and braga then distancia_alta.
if lisboa and porto then distancia_alta.
if lisboa and viseu then distancia_alta.
if lisboa and guimaraes then distancia_alta.
if lisboa and faro then distancia_alta.
if lisboa and coimbra then distancia_media.
if lisboa and chaves then distancia_alta.

if faro and braga then distancia_alta.
if faro and porto then distancia_alta.
if faro and viseu then distancia_alta.
if faro and guimaraes then distancia_alta.
if faro and lisboa then distancia_alta.
if faro and coimbra then distancia_alta.
if faro and chaves then distancia_alta.

if guimaraes and braga then distancia_baixa.
if guimaraes and porto then distancia_media.
if guimaraes and lisboa then distancia_alta.
if guimaraes and faro then distancia_alta.
if guimaraes and chaves then distancia_media.
if guimaraes and viseu then distancia_media.
if guimaraes and coimbra then distancia_media.

if viseu and porto then distancia_media.
if viseu and guimaraes then distancia_media.
if viseu and lisboa then distancia_alta.
if viseu and faro then distancia_alta.
if viseu and coimbra then distancia_media.
if viseu and chaves then distancia_alta.
if viseu and braga then distancia_media.

if sustentavel and custo_baixo then 'autocarro'.
if sustentavel and custo_medio then 'comboio'.
if sustentavel and custo_alto then 'comboio'.


if custo_baixo and distancia_baixa then 'autocarro'.
if custo_baixo and distancia_media then 'autocarro'.
if custo_baixo and distancia_alta then 'comboio'.
if custo_medio and distancia_baixa then 'autocarro'.
if custo_medio and distancia_media then 'comboio'.
if custo_medio and distancia_alta then 'comboio'.
if custo_alto and distancia_baixa then 'carro'.
if custo_alto and distancia_media then 'carro'.
if custo_alto and distancia_alta and porto and lisboa then 'aviao'.
if custo_alto and distancia_alta and porto and faro then 'aviao'.
if custo_alto and distancia_alta then 'carro'.








