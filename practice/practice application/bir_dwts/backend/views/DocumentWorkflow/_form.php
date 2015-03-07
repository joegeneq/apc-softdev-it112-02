<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use backend\models\Employee;
use backend\models\StationDesk;
use backend\models\document;
use yii\helpers\ArrayHelper;


/* @var $this yii\web\View */
/* @var $model backend\models\DocumentWorkflow */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="document-workflow-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'document_id')->dropdownList(
            ArrayHelper::map(document::find()->all(),'id','document_tracking_number'),
            ['prompt'=>'Select ID']
    ) ?>

    <?= $form->field($model, 'employee_id')->dropdownList(
            ArrayHelper::map(Employee::find()->all(),'id','name'),
            ['prompt'=>'Select ID']
    ) ?>

    <?= $form->field($model, 'station_desk_id')->dropdownList(
            ArrayHelper::map(StationDesk::find()->all(),'id','station_desk_name'),
            ['prompt'=>'Select ID']
    ) ?>

    <?= $form->field($model, 'document_wokflow_comments')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'document_wokflow_status')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'time_accepted')->textInput() ?>

    <?= $form->field($model, 'time_released')->textInput() ?>

    <?= $form->field($model, 'total_time_spent')->textInput() ?>

    <?= $form->field($model, 'create_time')->textInput() ?>

    <?= $form->field($model, 'update_time')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
