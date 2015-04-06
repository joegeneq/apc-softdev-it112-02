<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\bootstrap\Modal;
use yii\helpers\Url;


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
        <?= Html::button('Create Station Desk', ['value'=>Url::to('/bir_dwts/backend/web/index.php?r=station-desk%2Fcreate'),'class' => 'btn btn-success','id'=>'modalButton']) ?>
    </p>

    <?php
        Modal::begin([
                'header'=>'<h4>Station Desk</h4>',
                'id'=>'modal',
                'size'=>'modal-lg',
            ]);

        echo "<div id='modalContent'></div>";

        Modal::end()
    ?>

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
