A aplicação deve recriar um fluxo de SISTEMA DE COLETA DE DADOS.

- Ruby version: 2.7.0
- Rails version: 5.2.6.2
- Sqlite3 3.31.1


Passo a passo para os testes:

1. Execute o comando ' rake db:migrate '
 
2. Execute o comando ' bundle exec rake db:reset RAILS_ENV=test '
 
4. *Requests: ' rspec ./spec/requests/nomedoarquivo_spec.rb '

5. *Models:  ' rspec ./spec/models/nomedoarquivo_spec.rb '

