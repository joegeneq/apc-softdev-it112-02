<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\DocumentWorkflowStatus */

$this->title = 'Update Document Workflow Status: ' . ' ' . $model->document_workflow_status_name;
$this->params['breadcrumbs'][] = ['label' => 'Document Workflow Statuses', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->document_workflow_status_name, 'url' => ['view', 'id' => $model->document_workflow_status_name]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="document-workflow-status-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
