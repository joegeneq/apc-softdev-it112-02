<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Document;
use common\models\Employee;
use common\models\StationDesk;
use common\models\DocumentWorkflowStatus;

/* @var $this yii\web\View */
/* @var $model common\models\DocumentWorkflow */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="document-workflow-form">

<?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'document_id')->dropDownList(
        ArrayHelper::map(Document::find()->all(),'id', 'document_name'),
        ['prompt'=>'Select Document']
    ) ?>

    <?= $form->field($model, 'employee_id')->dropDownList(
        ArrayHelper::map(Employee::find()->all(),'id', 'employee_last_name'),
        ['prompt'=>'Select Employee']
    ) ?>

    <?= $form->field($model, 'station_desk_id')->dropDownList(
        ArrayHelper::map(StationDesk::find()->all(),'id', 'station_desk_code'),
        ['prompt'=>'Select Station Desk']
    ) ?>


    <?= $form->field($model, 'document_wokflow_comments')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'document_status_id')->dropDownList(
        ArrayHelper::map(DocumentWorkflowStatus::find()->all(),'id', 'document_workflow_status_name'),
        ['prompt'=>'Select DocumentStatus']
    ) ?>

    <?= $form->field($model, 'time_accepted')->textInput() ?>

    <?= $form->field($model, 'time_released')->textInput() ?>

    <?= $form->field($model, 'total_time_spent')->textInput() ?>

    <?= $form->field($model, 'employee_id1')->dropDownList(
        ArrayHelper::map(Employee::find()->all(),'id', 'employee_last_name'),
        ['prompt'=>'Select Employee']
    ) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
