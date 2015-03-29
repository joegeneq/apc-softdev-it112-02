<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Employee;
use common\models\StationDesk;
use common\models\StationDeskRole;

/* @var $this yii\web\View */
/* @var $model common\models\EmployeeHasStationDesk */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="employee-has-station-desk-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'employee_id')->dropDownList(
        ArrayHelper::map(Employee::find()->all(),'id', 'employee_last_name'),
        ['prompt'=>'Select Employee']
    ) ?>

    <?= $form->field($model, 'station_desk_id')->dropDownList(
        ArrayHelper::map(StationDesk::find()->all(),'id', 'station_desk_name'),
        ['prompt'=>'Select Station Desk']
    ) ?>

    <?= $form->field($model, 'station_desk_role_id')->dropDownList(
        ArrayHelper::map(StationDeskRole::find()->all(),'id', 'station_desk_role_name'),
        ['prompt'=>'Select Station Desk Role']
    ) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
