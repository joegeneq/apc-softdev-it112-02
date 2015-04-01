<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\DocumentType */

$this->title = 'Update Document Type: ' . ' ' . $model->document_type_name;
$this->params['breadcrumbs'][] = ['label' => 'Document Types', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->document_type_name, 'url' => ['view', 'id' => $model->document_type_name]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="document-type-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
