<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\DocumentWorkflow */

$this->title = $model->document_id;
$this->params['breadcrumbs'][] = ['label' => 'Document Workflows', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="document-workflow-view">

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
            [
                'label' => 'Tracking Number',
                'value' => $model->document->document_tracking_number,
            ],
            [
                'label' => 'Receiver',
                'value' => $model->employee->employee_last_name,
            ],
            [
                'label' => 'Station Desk',
                'value' => $model->stationDesk->station_desk_name,
            ],
            'document_wokflow_comments:ntext',
            [
                'label' => 'Document Status',
                'value' => $model->documentWorkflowStatus->document_workflow_status_name,
            ],
            [
                'attribute' => 'employee_id1',
                'value' => $model->employee->employee_last_name,
            ],
            'time_accepted',
            'time_released',
            'total_time_spent',
            'create_time',
            'update_time',
        ],
    ]) ?>

</div>
