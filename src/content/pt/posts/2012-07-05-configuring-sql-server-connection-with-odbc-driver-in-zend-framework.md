+++
title = "Configurando conexão SQL Server com driver ODBC no Zend Framework"
date = 2012-07-05
type = "post"
slug = "configuring-sql-server-connection-with-odbc-driver-in-zend-framework"
aliases = ["/configuring-sql-server-connection-with-odbc-driver-in-zend-framework"]
translationKey = "configuring-sql-server-connection-with-odbc-driver-in-zend-framework"
categories = ["TODO"]
tags = ["zend"]
+++

Grande parte dos Desenvolvedores Web que trabalham com sites ou desenvolvimento de sistemas utilizam MySQL ou PostgreSQL como banco de dados, e em um projeto que desenvolvi não foi diferente, optei por utilizar o MySQL.

Mas no decorrer do projeto, surgiu a necessidade de portá-lo para ser utilizado em SQL Server. Foi então que dei pulos de alegria por poder usufruir das facilidades que um ORM fornece em relação à abstração, neste caso, eu estava usando Doctrine 1.

Mas quem disse que foi fácil ou rápido? Apesar de simples, demorei um pouco para descobrir os “macetes” de como configurar o DSN da conexão para o SQL Server, e aqui neste post vai a dica para vocês que necessitarem realizar tal tarefa.

Junto com o Doctrine 1, foi utilizado Zend Framework no projeto, então, a configuração dos dados de conexão com o banco estavam no application.ini da aplicação. Neste arquivo constava o DSN de configuração da conexão, que no MySQL, é assim:

```ini
doctrine.dsn = "mysql://USERNAME:PASSWORD@HOSTNAME/DATABASE"
```

Para configurar o SQL Server aqui, a sintaxe é um pouco diferente, neste caso, utilizei o driver ODBC para conexão:

```ini
doctrine.dsn = "odbc:Driver={SQL Server};Server=HOSTNAME;Database=DATABASE;Uid=USERNAME;Pwd=PASSWORD"
```

É só isso?? NÃO, falta a parte de inicialização do Doctrine, que foi definida do arquivo Bootstrap da aplicação. Vejamos abaixo o exemplo do MySQL:

```php
protected function _initDoctrine()
{
    require_once 'Doctrine.php';
    $loader = Zend_Loader_Autoloader::getInstance();
    $loader->pushAutoloader(array('Doctrine', 'autoload'));
    $doctrineConfig = $this->getOption('doctrine');
 
    $manager = Doctrine_Manager::getInstance();
    $manager->setAttribute( Doctrine::ATTR_MODEL_LOADING, Doctrine::MODEL_LOADING_CONSERVATIVE);
    $manager->setAttribute( Doctrine_Core::ATTR_QUOTE_IDENTIFIER, true );
                 
    Doctrine::loadModels($doctrineConfig['models_path']);
    $manager->openConnection($doctrineConfig['dsn']);
    return $manager;
}
```

Até aqui você já deve estar familiarizado, certo? Isto funciona no MySQL perfeitamente, porém, no SQL Server é necessário fazer um ajuste na linha 13, pois precisamos passar o DSN da conexão em um array:

```php
$manager->openConnection( array($doctrineConfig['dsn']) );
```

Simples né?

Com essas dicas acima você já conseguirá rodar sua aplicação no SQL Server.

Quaisquer dicas e/ou sugestões, deixe seu comentário.