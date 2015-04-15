<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Employee;
use common\models\Position;
use dosamigos\datepicker\DatePicker;

/* @var $this yii\web\View */
/* @var $model common\models\EmployeeHasPosition */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="employee-has-position-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'employee_id')->dropDownList(
        ArrayHelper::map(Employee::find()->all(),'id', 'employee_last_name'),
        ['prompt'=>'Select Employee']
    ) ?>

    <?= $form->field($model, 'position_id')->dropDownList(
        ArrayHelper::map(Position::find()->all(),'id', 'position_name'),
        ['prompt'=>'Select Positionn']
    ) ?>

    <?= $form->field($model, 'employee_position_start_date')->widget(
         DatePicker::className(), [
        // inline too, not bad
        'inline' => false, 
         // modify template for custom rendering
        //'template' => '<div class="well well-sm" style="background-color: #fff; width:250px">{input}</div>',
        'clientOptions' => [
            'autoclose' => true,
            'format' => 'yyyy-mm-dd'
        ]
    ]);?>


    <?= $form->field($model, 'employee_position_end_date')->widget(
         DatePicker::className(), [
        // inline too, not bad
        'inline' => false, 
         // modify template for custom rendering
        //'template' => '<div class="well well-sm" style="background-color: #fff; width:250px">{input}</div>',
        'clientOptions' => [
            'autoclose' => true,
            'format' => 'yyyy-mm-dd'
        ]
    ]);?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
