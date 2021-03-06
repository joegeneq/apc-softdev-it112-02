<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\EmployeeHasPosition */

$this->title = $model->employee_id;
$this->params['breadcrumbs'][] = ['label' => 'Employee Has Positions', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="employee-has-position-view">

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
                'attribute' => 'employee_id',
                'value' => $model->employee->employee_last_name,
            ],
            [
                'attribute' => 'position_id',
                'value' => $model->position->position_name,
            ],
            'employee_position_start_date',
            'employee_position_end_date',
            'create_time',
            'update_time',
        ],
    ]) ?>

</div>
