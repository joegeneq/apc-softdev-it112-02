<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\DocumentCategory */

$this->title = 'Update Document Category: ' . ' ' . $model->document_category_name;
$this->params['breadcrumbs'][] = ['label' => 'Document Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->document_category_name, 'url' => ['view', 'id' => $model->document_category_name]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="document-category-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
