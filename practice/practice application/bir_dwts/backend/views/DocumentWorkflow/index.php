<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\DocumentWorkflowSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Document Workflows';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="document-workflow-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Document Workflow', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'document_id',
            'employee_id',
            'station_desk_id',
            'document_wokflow_comments:ntext',
            // 'document_wokflow_status',
            // 'time_accepted',
            // 'time_released',
            // 'total_time_spent',
            // 'create_time',
            // 'update_time',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
