<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\DocumentWorkflow */

$this->title = 'Create Document Workflow';
$this->params['breadcrumbs'][] = ['label' => 'Document Workflows', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="document-workflow-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
