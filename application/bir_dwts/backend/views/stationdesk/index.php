<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\StationDeskSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Station Desks';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="station-desk-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Station Desk', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
            'station_desk_code',
            'station_desk_name',
            'station_desk_notes:ntext',
            'create_time',
            // 'update_time',
            // 'section_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
