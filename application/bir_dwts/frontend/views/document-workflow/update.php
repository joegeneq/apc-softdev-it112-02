<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\DocumentWorkflow */

$this->title = 'Update Document Workflow: ' . ' ' . $model->document_id;
$this->params['breadcrumbs'][] = ['label' => 'Document Workflows', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->document_id, 'url' => ['view', 'id' => $model->document_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="document-workflow-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
