<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use backend\models\StationDesk;
use backend\models\Employee;
use backend\models\StationDeskRole;

/* @var $this yii\web\View */
/* @var $model backend\models\EmployeeHasStationDesk */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="employee-has-station-desk-form">

    <?php $form = ActiveForm::begin(); ?>
	
	<?= $form->field($model, 'employee_id')->dropdownList(
            ArrayHelper::map(Employee::find()->all(),'id','name'),
            ['prompt'=>'Select ID']
    ) ?>

	<?= $form->field($model, 'station_desk_id')->dropdownList(
            ArrayHelper::map(StationDesk::find()->all(),'id','station_desk_name'),
            ['prompt'=>'Select ID']
    ) ?>

	<?= $form->field($model, 'station_desk_role_id')->dropdownList(
            ArrayHelper::map(StationDeskRole::find()->all(),'id','station_desk_code'),
            ['prompt'=>'Select code']
    ) ?>

    <?= $form->field($model, 'time_created')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
