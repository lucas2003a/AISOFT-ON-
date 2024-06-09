<?php
// tick checkboxes from an existing DOCX

require_once '../../../classes/CreateDocx.php';

$docx = new CreateDocxFromTemplate('../../files/Checkbox.docx');

// 1 enabled, 0 disabled
$variables = array('check1' => 1, 'check2' => 0, 'check3' => 1);
$docx->tickCheckboxes($variables);

$docx->createDocx('example_tickCheckboxes_1');