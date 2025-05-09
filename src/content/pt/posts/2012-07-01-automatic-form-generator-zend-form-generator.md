+++
title = "Gerador automático de formulários – Zend Form Generator"
date = 2012-07-01
type = "post"
slug = "automatic-form-generator-zend-form-generator"
translationKey = "automatic-form-generator-zend-form-generator"
categories = ["TODO"]
tags = ["zend"]
redirect_from:
    - /gerador-automatico-de-formularios-zend-form-generator/
+++

Criar formulários, na maioria das vezes, torna-se uma atividade muito repetitiva e também cansativa, principalmente se em sua aplicação existem muitos formulários a serem criados.

Pensando nisso, desenvolvi uma maneira mais fácil para criar estes formulários, se chama Zend Form Generator, e beneficia os utilizadores do Zend Form.

O projeto encontra-se [neste repositório][zend-form-generator] no GitHub.

A logística é a seguinte: grande parte dos formulários da aplicação, efetuarão coleta das informações digitadas para serem inseridas no banco de dados. Partindo deste princípio, podemos imaginar que, para cada tabela existente no banco de dados, deverá ser necessário construir um formulário afim de coletar dados para esta tabela.

Baseado na logística descrita acima, desenvolvi uma biblioteca para ler as tabelas de um banco de dados e suas respectivas colunas, e com isso, criar os respectivos formulários e seus campos.

Atualmente o projeto dá suporte para banco de dados MySQL e PostgreSQL. O objetivo é estender essa biblioteca para dar suporte aos banco de dados suportados pelo PDO e também prover uma maneira melhor para estilizar os formulários utilizando os Decorators.

Para usar é fácil, configure o seu banco de dados no arquivo zend-form-generator.php

Em seguida basta você executar o script na linha de comando e passar o parâmetro “generate-forms” seguido do nome da pasta onde deseja criar seus formulários, em nosso exemplo, chamamos de “Forms”:

{%- highlight php -%}
php zend-form-generator.php generate-forms Forms
{%- endhighlight -%}

Por padrão, os formulários serão gerados com a nomenclatura padrão das aplicações Zend “Application_Form_XXXX”. Caso você deseje utilizar namespaces ao invés deste padrão, basta apenas especificar o nome do namespace após o nome da pasta onde irá gerar os formulários:

{%- highlight php -%}
php zend-form-generator.php generate-forms Forms Name\Your\Namespace
{%- endhighlight -%}

Você vai notar que todos os formulários gerados, não irão ser criados com as chaves primárias das tabelas, pois geralmente, estas chaves primárias serão geradas automaticamente no banco de dados. Caso você precise criar os formulários com estes campos de chave primária, basta inserir o parâmetro “–primary-keys” antes do nome da pasta de destino. Esta dica também vale para a geração de formulários com namespaces:

{%- highlight php -%}
php zend-form-generator.php generate-forms --primary-keys Forms
{%- endhighlight -%}

Dúvidas? Sugestões? Deixe seu comentário abaixo.

[zend-form-generator]: https://github.com/ionixjunior/zend-form-generator