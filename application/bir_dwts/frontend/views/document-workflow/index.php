<?php

use yii\helpers\Html;
use kartik\grid\GridView;
use yii\widgets\Pjax;
use yii\bootstrap\Modal;
use yii\helpers\Url;
use common\models\Document;
use common\models\Employee;
use common\models\StationDesk;
use common\models\DocumentWorkflowStatus;
use kartik\export\ExportMenu;

/* @var $this yii\web\View */
/* @var $searchModel common\models\DocumentWorkflowSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Document Workflows';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="document-workflow-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::button('Create Document Workflows', ['value'=>Url::to('index.php?r=document-workflow%2Fcreate'),'class' => 'btn btn-success','id'=>'modalButton']) ?>
    </p>

    <?php
        Modal::begin([
                'header'=>'<h4>Document Workflows</h4>',
                'id'=>'modal',
                'size'=>'modal-lg',
            ]);

        echo "<div id='modalContent'></div>";

        Modal::end()
    ?>

    <?php
    $gridColumns = [
    ['class' => 'yii\grid\SerialColumn'],

//            'id',
            [
                'attribute' => 'document_id',
                'value' => 'document.document_tracking_number',
            ],
            [
                'attribute' => 'employee_id',
                'value' => 'employee.employee_last_name',
            ],
            [
                'attribute' => 'station_desk_id',
                'value' => 'stationDesk.station_desk_name',
            ],
           'document_wokflow_comments:ntext',
            [

                'attribute' => 'document_workflow_status_id',
                'value' => 'documentWorkflowStatus.document_workflow_status_name',

            ],
            [
                'attribute' => 'employee_id1',
                'value' => 'employee.employee_last_name',
            ],
            'time_accepted',
            'time_released',
            'total_time_spent',
            'create_time',
          'update_time',

            ['class' => 'yii\grid\ActionColumn'],
    ];?>

    <div class="export-menu">
    <?php
    echo ExportMenu::widget([
        'dataProvider' => $dataProvider,
        'columns' => $gridColumns
    ]);
    ?>
    </div>

    <?php
    echo GridView::widget([
        'dataProvider'=> $dataProvider,
        'filterModel' => $searchModel,
        'columns' => $gridColumns,
        'responsive'=>true,
        'hover'=>true,
    ]); ?>

</div>
