<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\DocumentWorkflowStatus */

$this->title = 'Create Document Workflow Status';
$this->params['breadcrumbs'][] = ['label' => 'Document Workflow Statuses', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="document-workflow-status-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
