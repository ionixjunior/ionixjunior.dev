---
layout: post
title: "Configuring SQL Server connection with ODBC driver in Zend Framework"
date: 2012-07-05
redirect_from:
    - /configurando-conexao-sql-server-com-driver-odbc-no-zend-framework
---

<p class="intro"><span class="dropcap">M</span>any Web Developers who work with websites or systems development use MySQL or PostgreSQL as their database, and in a project I developed, it was no different - I opted for MySQL.</p>

However, during the project, the need arose to switch to using SQL Server. That's when I was delighted to take advantage of the facilities that an ORM provides in terms of abstraction, in this case, I was using Doctrine 1.

But who said it was easy or quick? Although it's simple, it took me a little while to figure out the "tricks" of configuring the DSN connection for SQL Server, and in this post, I'll share the tips for those of you who need to perform this task.

Together with Doctrine 1, Zend Framework was used in the project, so the configuration of the database connection data was in the application.ini file of the application. In this file, the DSN configuration for MySQL looks like this:

{%- highlight ini -%}
doctrine.dsn = "mysql://USERNAME:PASSWORD@HOSTNAME/DATABASE"
{%- endhighlight -%}

To configure SQL Server here, the syntax is a little different. In this case, I used the ODBC driver for the connection:

{%- highlight ini -%}
doctrine.dsn = "odbc:Driver={SQL Server};Server=HOSTNAME;Database=DATABASE;Uid=USERNAME;Pwd=PASSWORD"
{%- endhighlight -%}

Is that all? NO, there's still the part of Doctrine initialization, which was defined in the Bootstrap file of the application. Let's see the example for MySQL:

{%- highlight php -%}
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
{%- endhighlight -%}

Until here, you should already be familiar, right? This works perfectly with MySQL. However, for SQL Server, you need to make an adjustment on line 13 since we need to pass the DSN connection in an array:

{%- highlight php -%}
$manager->openConnection( array($doctrineConfig['dsn']) );
{%- endhighlight -%}

Simple, right?

With these tips above, you can now run your application on SQL Server.

For any tips and/or suggestions, please leave your comments.