:- dynamic(fact/1), [forward,proof,bdparteb,sbcparteb].

%Base de conhecimento

:- op( 800, fx, if).
:- op( 700, xfx, then).
:- op( 300, xfy, or).
:- op( 200, xfy, and).

%INTERFACE

menu :- nl, nl, write('Sistema de recomendacao de viagens! Descubra a melhor viagem para o seu perfil!'),nl,
    write('1 - Entrar no sistema'),nl,
    write('2 - Ajuda'),nl,
    write('3 - Sair'),nl,
    read(A),
    avaliar(A).

avaliar(1):- questao1.
avaliar(2):- write('Para comecar escreva menu.').
avaliar(3):- write('A sair!'), halt.

resultadowrite:- demo, fact(Nome),fact(A),fact(B),viagem(A,B,Nome,Distancia,Custo),
    %demo(Nome,Proof),
    write('Devia utilizar o transporte: '),write(Nome),nl,write('A distancia e: '),write(Distancia),nl,write('A viagem tem um custo de: '),write(Custo).



questao1:-	write('********************************************************************************************************'), nl,
			write('**  Em que local esta?'), nl,
			write('**'),nl,
			write('**  1 - Guimaraes '), nl,
			write('**  2 - Chaves'), nl,
                        write('**  3 - Braga'), nl,
                        write('**  4 - Porto'), nl,
                        write('**  5 - Viseu'), nl,
                        write('**  6 - Coimbra'), nl,
                        write('**  7 - Lisboa'), nl,
                        write('**  8 - Faro'), nl,
			read(A1),
			(
			(A1 == 1),assert(fact('o_guimaraes')), questao2;
            (A1 == 2),assert(fact('o_chaves')), questao2;
            (A1 == 3),assert(fact('o_braga')), questao2;
            (A1 == 4),assert(fact('o_porto')), questao2;
            (A1 == 5),assert(fact('o_viseu')), questao2;
            (A1 == 6),assert(fact('o_coimbra')), questao2;
            (A1 == 7),assert(fact('o_lisboa')), questao2;
            (A1 == 8),assert(fact('o_faro')), questao2).

questao2:-	write('********************************************************************************************************'), nl,
					write('**'),nl,
			write('**  1 - Guimaraes '), nl,
			write('**  2 - Chaves'), nl,
                        write('**  3 - Braga'), nl,
                        write('**  4 - Porto'), nl,
                        write('**  5 - Viseu'), nl,
                        write('**  6 - Coimbra'), nl,
                        write('**  7 - Lisboa'), nl,
                        write('**  8 - Faro'), nl,
			read(A2),
			(
			(A2 == 1),assert(fact('guimaraes')), questao3;
            (A2 == 2),assert(fact('chaves')), questao3;
            (A2 == 3),assert(fact('braga')), questao3;
            (A2 == 4),assert(fact('porto')), questao3;
            (A2 == 5),assert(fact('viseu')), questao3;
            (A2 == 6),assert(fact('coimbra')), questao3;
            (A2 == 7),assert(fact('lisboa')), questao3;
            (A2 == 8),assert(fact('faro')), questao3).



questao3:-	write('********************************************************************************************************'), nl,
			write('**  Qual e a o custo que pertende ter?'), nl,

            write('** 1 - Custo baixo'),nl,
            write('** 2 - Custo medio'),nl,
            write('** 3 - Custo alto'),nl,

			read(A3),
			(
			(A3 == 1),assert(fact('custo_baixo')), questao4;
            (A3 == 2),assert(fact('custo_medio')), questao4;
            (A3 == 3),assert(fact('custo_alto')), questao4).


questao4:-  write('********************************************************************************************************'), nl,
            write('**  Qual pensa ser o seu transporte ideal?'), nl,
            write('** 1 - autocarro'),nl,
            write('** 2 - carro'),nl,
            write('** 3 - comboio'),nl,
            write('** 4 - aviao'),nl,

            read(A4),
            ((A4==1), (demo('autocarro',Proof)->write(Proof);write('False'));
                (A4==2), (demo('carro',Proof)->write(Proof);write('False'));
                (A4==3), (demo('comboio',Proof)->write(Proof);write('False'));
                (A4==4), (demo('aviao',Proof)->write(Proof);write('False'))),nl,resultado
            .


resultado :-	write('********************************************************************************************************'), nl,
				write('**                                                                                                    **'), nl,
				write('**                                         Resultado Obtido                                           **'), nl,
				write('**                                                                                                    **'), nl,
				write('********************************************************************************************************'),
                demo,resultadowrite,retractall(fact(_)).

%:-menu.
