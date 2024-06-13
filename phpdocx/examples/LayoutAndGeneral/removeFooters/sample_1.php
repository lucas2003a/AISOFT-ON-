<?php
// remove footers from an existing DOCX

require_once '../../../classes/CreateDocx.php';

$docx = new CreateDocxFromTemplate('../../files/TemplateHeaderAndFooter.docx');

$docx->removeFooters();

$docx->createDocx('example_removeFooters_1');