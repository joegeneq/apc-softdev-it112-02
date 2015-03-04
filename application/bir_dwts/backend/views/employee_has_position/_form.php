<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use backend\models\Employee;
use backend\models\Postion;

/* @var $this yii\web\View */
/* @var $model backend\models\EmployeeHasPosition */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="employee-has-position-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'employee_id')->dropDownList(
    ArrayHelper::map(Employee::find()->all(),'id','name'),
        ['prompt'=>'Select myaddress']
    ) ?>

    <?= $form->field($model, 'position_id')->dropDownList(
    ArrayHelper::map(Postion::find()->all(),'id','postion_description'),
        ['prompt'=>'Select myaddress']
    ) ?>

    <?= $form->field($model, 'employee_position_start_date')->textInput() ?>

    <?= $form->field($model, 'employee_position_end_date')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'create_time')->textInput() ?>

    <?= $form->field($model, 'update_time')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
