
Install locally in .vscode folder the composer

terminal to the workspace .vscode and make a composer folder go to that folder.
make a composer.json. copy in the code.

run composer install




  "_see_local_php-cs-fixer.executablePath": "/home/vscode/.config/composer/vendor/bin/php-cs-fixer",
  "php-cs-fixer.onsave": true,
  "php-cs-fixer.config": ".php-cs-fixer.php;.php-cs-fixer.dist.php;.php_cs;.php_cs.dist;/home/vscode/.config/composer/.php-cs-fixer.php",


❯ cat composer.json
{
    "require-dev": {
        "friendsofphp/php-cs-fixer": "^3"
    }
}



❯ cat /home/vscode/.config/composer/.php-cs-fixer.php
<?php

$config = new PhpCsFixer\Config();
return $config->setRules([
    '@PSR2' => true,
    'array_indentation' => true,
    'array_syntax' => ['syntax' => 'short'],
    'binary_operator_spaces' => [
        'default' => 'single_space',
        'operators' => ['=>' => 'single_space']
    ],
    'method_chaining_indentation' => true,
    'no_unused_imports' => true,
    'no_whitespace_before_comma_in_array' => true,
    'no_whitespace_in_blank_line' => true,
    'single_space_after_construct' => true,
])
->setFinder(PhpCsFixer\Finder::create()->in(__DIR__));
