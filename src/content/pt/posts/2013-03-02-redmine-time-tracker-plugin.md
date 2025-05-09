+++
title = "Redmine Time Tracker plugin"
date = 2013-03-02
type = "post"
slug = "redmine-time-tracker-plugin"
translationKey = "redmine-time-tracker-plugin"
categories = ["TODO"]
tags = ["misc"]
+++

Nos primeiros testes que fiz com Redmine, percebi que a maneira que ele disponibiliza para fazer apontamento de horas é um pouco precária, e até onde vi, não existe um client estilo o Worklog, e principalmente, open source, para realizar essa tarefa de maneira sutil.

Foi então que achei o plugin Redmine Time Tracker. Com ele você consegue ter uma interface mais agradável para realizar apontamento de horas. Não tem toda a praticidade de um client, mas é possível escolher uma issue e em seguida iniciar o apontamento de horas.

Porém, ao realizar os primeiros testes encontrei alguns problemas.

No apontamento de horas padrão do Redmine, é possível escolher o tipo de horas apontadas, por exemplo, suporte, desenvolvimento  e outros tipos que o administrador poderá cadastrar. Mas no apontamento de horas realizado por este plugin, não é possível realizar esta seleção, o tipo de apontamento cadastrado para todos estes registros é uma marcação própria do plugin.

Como eu precisava ter um controle dos tipos de atividades realizadas pelos apontamentos utilizando o plugin, decidi realizar um fork do plugin e implementar o campo do tipo de atividade na tela de cadastramento do apontamento.

O plugin pode ser encontrado [neste repositório][redmine-time-tracker] no GitHub.

Como pode ser visto abaixo, a única implementação realizada foi adicionar o campo “Activity” no formulário.

<figure>
	<img src="/assets/img/redmine-time-tracker-plugin-custom-by-ionixjunior.png" alt="Imagem da tela do Redmine com o campo Activity adicionado."> 
	<figcaption>Imagem da tela do Redmine com o campo Activity adicionado.</figcaption>
</figure>

Com isso, é possível obter relatórios de apontamento de horas de forma mais correta, pois cada apontamento estará vinculado ao seu correto tipo de atividade.

[redmine-time-tracker]: https://github.com/ionixjunior/redmine_time_tracker