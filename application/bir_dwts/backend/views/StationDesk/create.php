<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\StationDesk */

$this->title = 'Create Station Desk';
$this->params['breadcrumbs'][] = ['label' => 'Station Desks', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="station-desk-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
