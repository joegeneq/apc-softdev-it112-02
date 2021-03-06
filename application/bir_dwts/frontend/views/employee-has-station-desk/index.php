<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\bootstrap\Modal;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel common\models\EmployeeHasStationDeskSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Employee Has Station Desks';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="employee-has-station-desk-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::button('Create Employee Has Station Desks', ['value'=>Url::to('index.php?r=employee-has-station-desk%2Fcreate'),'class' => 'btn btn-success','id'=>'modalButton']) ?>
    </p>

    <?php
        Modal::begin([
                'header'=>'<h4>Employee Has Station Desks</h4>',
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
            [
                'attribute' => 'employee_id',
                'value' => 'employee.employee_last_name',
            ],
            [
                'attribute' => 'station_desk_id',
                'value' => 'stationDesk.station_desk_name',
            ],
            [
                'attribute' => 'station_desk_role_id',
                'value' => 'stationDeskRole.station_desk_role_name',
            ],

            'create_time',
            'update_time',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
