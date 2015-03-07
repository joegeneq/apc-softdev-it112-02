<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\DocumentWorkflowSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="document-workflow-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'document_id') ?>

    <?= $form->field($model, 'employee_id') ?>

    <?= $form->field($model, 'station_desk_id') ?>

    <?= $form->field($model, 'document_wokflow_comments') ?>

    <?php // echo $form->field($model, 'document_wokflow_status') ?>

    <?php // echo $form->field($model, 'time_accepted') ?>

    <?php // echo $form->field($model, 'time_released') ?>

    <?php // echo $form->field($model, 'total_time_spent') ?>

    <?php // echo $form->field($model, 'create_time') ?>

    <?php // echo $form->field($model, 'update_time') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
