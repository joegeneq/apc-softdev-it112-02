<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Employee */

$this->title = $model->employee_last_name . $model->employee_first_name;
$this->params['breadcrumbs'][] = ['label' => 'Employees', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="employee-view">

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
            'employee_id_number',
            'employee_last_name',
            'employee_first_name',
            [
                'attribute' => 'current_position',
                'value' => $model->position->position_name,
            ],
            [
                'attribute' => 'section_id',
                'value' => $model->section->section_name,
            ],
            [
                'attribute' => 'user_id',
                'value' => $model->user->username,
            ],
            'create_time',
            'update_time',
        ],
    ]) ?>

</div>
