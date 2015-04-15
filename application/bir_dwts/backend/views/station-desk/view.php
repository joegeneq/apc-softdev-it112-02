<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\StationDesk */

$this->title = $model->station_desk_name;
$this->params['breadcrumbs'][] = ['label' => 'Station Desks', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="station-desk-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
//            'id',
            'station_desk_code',
            'station_desk_name',
            'station_desk_notes:ntext',
            [
                'attribute' => 'section_id',
                'value' => $model->section->section_name,
            ],
            'create_time',
            'update_time',
        ],
    ]) ?>

</div>
