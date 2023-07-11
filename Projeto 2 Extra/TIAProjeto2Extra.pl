arco(braga,porto).
arco(braga,viseu).
arco(porto,lisboa).
arco(lisboa,faro).
arco(porto,viseu).
arco(braga,guimaraes).
arco(guimaraes,porto).
arco(viseu,coimbra).
arco(coimbra,braga).
arco(coimbra,lisboa).

dist(braga,porto,comboio,50,3).
dist(braga,porto,autocarro,70,14).
dist(braga,porto,automovel,40,15).
dist(braga,viseu,automovel,200,90).
dist(porto,lisboa,comboio,180,60).
dist(porto,lisboa,automovel,150,90).
dist(porto,lisboa,aviao,120,130).
dist(porto,lisboa,autocarro,150,25).
dist(lisboa,faro,comboio,240,80).
dist(lisboa,faro,automovel,200,150).
dist(lisboa,faro,aviao,120,140).
dist(lisboa,faro,autocarro,240,70).
dist(porto,viseu,automovel,200,90).
dist(porto,viseu,comboio,260,70).
dist(porto,viseu,autocarro,250,60).
dist(braga,guimaraes,automovel,20,10).
dist(braga,guimaraes,autocarro,30,15).
dist(guimaraes,porto,automovel,50,14).
dist(guimaraes,porto,comboio,70,3).
dist(guimaraes,porto,autocarro,60,12).
dist(viseu,coimbra,automovel,100,40).
dist(coimbra,braga,automovel,90,60).
dist(coimbra,lisboa,comboio,120,30).

caminhocurto(X,Y,C,NC,LTR):-caminho(X,Y,C), % gerar
 maiscurto(X,Y,C,NC,LTR).% testar
maiscurto(X,Y,C,NC,LTR):- custo(C,LTR,NC),
 \+ menor(X,Y,NC),reverse(C,CR),write('O caminho ideal e: '),write(CR),nl,reverse(LTR,LR),write('Os Transportes sao: '),write(LR). %caso erro mudar <----
menor(X,Y,NC):- caminho(X,Y,C1),
 custo(C1,_,NC1),%nl,write(NC1),nl,write(T),
 NC1<NC.

% caminho.pl
caminho(X,Z,Caminho):-caminho(X,Z,[X],Caminho).
caminho(X,X,Caminho,Caminho).
caminho(X,Z,Visitado,Caminho)
 :- arco(X,Y),
 \+ member(Y,Visitado),
caminho(Y,Z,[Y | Visitado],Caminho).

custo([_],[],0).
custo([A,B|C],[T|T2],Temp):- dist(B,A,T,Tempo,_), custo([B|C],T2,Temp2), Temp is Tempo + Temp2.

menu :- nl, nl, write('Sistema de recomendacao de transportes!'),nl,
    write('1 - Entrar no sistema'),nl,
    write('2 - Ajuda'),nl,
    write('3 - Sair'),nl,
    read(A),
    avaliar(A).

avaliar(1):- questao1.
avaliar(2):- write('Para comecar escreva menu.').
avaliar(3):- write('A sair!'), halt.

questao1:- write("De onde vai partir?"),nl,nl,
        write("1 - braga"),nl,
        write("2 - porto"),nl,
        write("3 - lisboa"),nl,
        write("4 - guimaraes"),nl,
        write("5 - viseu"),nl,
        write("6 - coimbra"),nl,
        read(A1),
        (
            (A1 == 1),questao2(braga);
            (A1 == 2),questao2(porto);
            (A1 == 3),questao2(lisboa);
            (A1 == 4),questao2(guimaraes);
            (A1 == 5),questao2(viseu);
            (A1 == 6),questao2(coimbra)).

questao2(A1):- write("Para onde vai?"),nl,nl,
        write("1 - lisboa"),nl,
        write("2 - porto"),nl,
        write("3 - viseu"),nl,
        write("4 - faro"),nl,
        write("5 - guimaraes"),nl,
        write("6 - coimbra"),nl,
        write("7 - braga"),nl,
        read(A2),
        (
            (A2 == 1),caminhocurto(A1,lisboa,_,C,_);
            (A2 == 2),caminhocurto(A1,porto,_,C,_);
            (A2 == 3),caminhocurto(A1,viseu,_,C,_);
            (A2 == 4),caminhocurto(A1,faro,_,C,_);
            (A2 == 5),caminhocurto(A1,guimaraes,_,C,_);
            (A2 == 6),caminhocurto(A1,coimbra,_,C,_);
            (A2 == 7),caminhocurto(A1,braga,_,C,_)),nl,write('Tempo: '), write(C).
