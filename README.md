# Projeto-final-VHDL
Jogo da toupeira em VHDL para placa FPGA 

Todos os arquivos estão com a letra 'A'  no inicio do nome pra ficarem agrupados.
O arquivo main é o ''Atoupeira''.

- É necessário fazer um map de entradas e saídas. 
- Utiliza clock de 500hz. 
- O estado inicial é Start que emite um sinal de reset e logo em seguida passa para o estado de Setup.
- No Setup há o nível de dificuldade (altera a velocidade em que as toupeiras aparecem), letra L no hex 2, e a sequência de toupeiras, letra J.
- Key 0 é o reset, Key 1 alterna entre L e J, key 2 incrementa 1 e Key 3 começa o jogo. 
- Serão 4 rounds com 8 toupeiras cada round. Cada toupeira vale 1 ponto vezes o número do round (1 ponto no primeiro, 2 no segundo , 3 no terceiro e 4 no último).
- As toupeiras aparecem como leds acessos e usa-se os switch para ''acertar'' a toupeira.
- Durante o jogo é mostrada a pontuação nos hex 1 e 0 e a letra P no hex 2. 
- A pontuação está em hexadecimal.
- Após o final de cada round aparece no hex a pontuação atual e o round anterior (0 à 3) (alternadamente).
- Key 3 para ir ao próximo round.
- Após o 4º round aparecerá alternadamente a palavra END e a pontuação final nos hex.
- key 0 para retornar ao setup.

