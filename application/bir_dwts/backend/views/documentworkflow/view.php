<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\DocumentWorkflow */

$this->title = $model->id;
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
            'id',
            'document_id',
            'employee_id',
            'station_desk_id',
            'document_wokflow_comments:ntext',
            'document_status_id',
            'time_accepted',
            'time_released',
            'total_time_spent',
            'create_time',
            'update_time',
            'employee_id1',
        ],
    ]) ?>

</div>