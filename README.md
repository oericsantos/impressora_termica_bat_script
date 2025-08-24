# Script para monitorar diretórios especificos por um arquivo chamado pedido.txt

Monitore os diretórios C:\Impressoes\Caixa, Bar e Cozinha por um arquivo pedido.txt. Crie previamente as pastas e impressoras virtuais “Generic / Text Only” com porta local apontando para &lt;pasta>\pedido.txt. Ao imprimir, o script renomeia o texto com timestamp, mantendo UTF-8, e remove o original.



###  Pré-requisitos

Antes de rodar este script, configure:

1. **Pastas de destino** (criadas manualmente):
   - `C:\Impressoes\Caixa`
   - `C:\Impressoes\Bar`
   - `C:\Impressoes\Cozinha`

2. **Impressoras virtuais para texto**
   - No **Painel de Controle → Dispositivos e Impressoras**, escolha `Adicionar impressora`.
   - Selecione “Adicionar uma impressora local”.
   - Crie uma **Porta Local**, nomeando-a como:
     ```
     C:\Impressoes\Caixa\pedido.txt
     ```
   - Escolha o driver **Generic / Text Only**.
   - Dê um nome relevante, como `Impressora Caixa`.

   Repita para `Bar` e `Cozinha`, cada uma apontando para sua pasta e arquivo `pedido.txt`.

Com isso, qualquer impressão feita para essas impressoras gerará automaticamente `pedido.txt` na pasta correta, e o script monitorará e processará o arquivo com timestamp.
