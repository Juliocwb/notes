#!/bin/bash

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)

# if [ $resposta_http -eq 200 ]
# then    
#     echo "Tudo esta ok com o servidor"
# else
#     echo "Houve um problema no servidor. Tentando reinicializar"
#     systemctl restart apache2
#     echo "...Servidor reinicializado"
# fi


if [ $resposta_http -ne 200 ]
then    
mail -s "Problema no servidor" tiago.koakoski@gmail.com<<del
Houve um problema no servidor, e foi necessario reiniciar o servico.
del
systemctl restart apache2
fi