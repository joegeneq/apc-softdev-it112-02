<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\StationDesk */

$this->title = 'Update Station Desk: ' . ' ' . $model->station_desk_name;
$this->params['breadcrumbs'][] = ['label' => 'Station Desks', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->station_desk_name, 'url' => ['view', 'id' => $model->station_desk_name]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="station-desk-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
