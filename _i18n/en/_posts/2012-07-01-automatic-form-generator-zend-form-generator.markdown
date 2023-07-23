---
layout: post
title: "Automatic form generator - Zend Form Generator"
date: 2012-07-01
translations: ["pt"]
redirect_from:
    - /gerador-automatico-de-formularios-zend-form-generator
---

<p class="intro"><span class="dropcap">C</span>reating forms often becomes a very repetitive and tiring task, especially if your application requires the creation of many forms.</p>

To address this, I developed an easier way to create forms called Zend Form Generator, which benefits Zend Form users.

The project can be found [in this repository][zend-form-generator] on GitHub.

The logic is as follows: in most cases, the forms in the application will collect information to be inserted into the database. Based on this, we can imagine that, for each table in the database, a form will need to be created to collect data for that table.

Based on the described logic, I developed a library to read the tables and their respective columns from a database and, with this information, generate the corresponding forms and their fields.

Currently, the project supports MySQL and PostgreSQL databases. The goal is to extend this library to support databases supported by PDO and also to provide a better way to style forms using decorators.

Using it is easy. First, configure your database in the zend-form-generator.php file.

Then, you simply need to execute the script on the command line, passing the "generate-forms" parameter followed by the name of the folder where you want to create your forms. In our example, we'll call it "Forms":

{%- highlight php -%}
php zend-form-generator.php generate-forms Forms
{%- endhighlight -%}

By default, the forms will be generated with the standard Zend application naming convention "Application_Form_XXXX". If you prefer to use namespaces instead of this convention, you just need to specify the namespace name after the folder name where you want to generate the forms:

{%- highlight php -%}
php zend-form-generator.php generate-forms Forms Name\Your\Namespace
{%- endhighlight -%}

You will notice that all the generated forms will not include the primary keys of the tables since these primary keys are generally auto-generated in the database. If you need to create forms with these primary key fields, simply add the "--primary-keys" parameter before the destination folder name. This tip also applies when generating forms with namespaces:

{%- highlight php -%}
php zend-form-generator.php generate-forms --primary-keys Forms
{%- endhighlight -%}

Any questions or suggestions? Please leave your comments below.

[zend-form-generator]: https://github.com/ionixjunior/zend-form-generator