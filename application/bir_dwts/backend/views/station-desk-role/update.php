<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\StationDeskRole */

$this->title = 'Update Station Desk Role: ' . ' ' . $model->station_desk_role_name;
$this->params['breadcrumbs'][] = ['label' => 'Station Desk Roles', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->station_desk_role_name, 'url' => ['view', 'id' => $model->station_desk_role_name]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="station-desk-role-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
