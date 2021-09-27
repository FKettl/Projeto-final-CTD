# Projeto-final-VHDL
Jogo da toupeira em VHDL

Todos os arquivos estão com a letra 'A' no inicio pra eles ficarem em primeiro na lista de arquivos.

O arquivo main é o ''Atoupeira''.

Key 0 é o reset.
O estado inicial é Start que emite um sinal de reset e logo em seguida passa para o estado de Setup.
No Setup há o nível de dificuldade (altera a velocidade em que as toupeiras aparecem), letra L no hex 2, e a sequência de toupeiras, letra J.
Key 1 alterna entre L e J, key 2 incrementa 1. Ambos vão de 0 a 3.
Key 3 começa o jogo.
Serão 4 rounds com 8 toupeiras cada round. Cada toupeira vale 1 ponto vezes o número do round (1 ponto no primeiro, 2 no segundo , 3 no terceiro e 4 no último).
A pontuação está em hexadecimal.
Após o final de cada round aparece no hex a pontuação atual e o round anterior (0 à 3) (alternadamente).
Key 3 para ir ao próximo round.
Após o 4º round aparecerá alternadamente a palavra END e a pontuação final nos hex.
key 0 para retornar ao setup.

