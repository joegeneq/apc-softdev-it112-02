<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use backend\models\Employee;
use backend\models\Document;
use backend\models\StationDesk;


/* @var $this yii\web\View */
/* @var $model backend\models\DocumentWorkflow */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="document-workflow-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'document_id')->dropDownList(
        ArrayHelper::map(Document::find()->all(),'id','document_description'),
        ['prompt'=>'Select Document']
    ) ?>

    <?= $form->field($model, 'employee_id')->dropDownList(
        ArrayHelper::map(Employee::find()->all(),'id','last_name'),
        ['prompt'=>'Select Employee']
    ) ?>

    <?= $form->field($model, 'station_desk_id')->dropDownList(
        ArrayHelper::map(StationDesk::find()->all(),'id','station_desk_name'),
        ['prompt'=>'Select StationDesk']
    ) ?>

    <?= $form->field($model, 'document_wokflow_comments')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'document_wokflow_status')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'time_accepted')->textInput() ?>

    <?= $form->field($model, 'time_released')->textInput() ?>

    <?= $form->field($model, 'total_time_spent')->textInput() ?>

    <?= $form->field($model, 'next_receiver')->dropDownList(
        ArrayHelper::map(Employee::find()->all(),'id','last_name'),
        ['prompt'=>'Select Employee']
    ) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
