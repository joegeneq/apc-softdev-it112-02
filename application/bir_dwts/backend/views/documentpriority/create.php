<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\DocumentPriority */

$this->title = 'Create Document Priority';
$this->params['breadcrumbs'][] = ['label' => 'Document Priorities', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="document-priority-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
