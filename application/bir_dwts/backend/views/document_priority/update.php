<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\DocumentPriority */

$this->title = 'Update Document Priority: ' . ' ' . $model->document_priority_name;
$this->params['breadcrumbs'][] = ['label' => 'Document Priorities', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->document_priority_name, 'url' => ['view', 'id' => $model->document_priority_name]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="document-priority-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
