<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\bootstrap\Modal;
use yii\helpers\Url;

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
        <?= Html::button('Create Document Workflow', ['value'=>Url::to('/bir_dwts/backend/web/index.php?r=document-workflow%2Fcreate'),'class' => 'btn btn-success','id'=>'modalButton']) ?>
    </p>

    <?php
        Modal::begin([
                'header'=>'<h4>Document Workflow</h4>',
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
            'document_id',
            'employee_id',
            'station_desk_id',
            'document_wokflow_comments:ntext',
            // 'document_status_id',
            // 'time_accepted',
            // 'time_released',
            // 'total_time_spent',
            'create_time',
            'update_time',
            // 'employee_id1',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
