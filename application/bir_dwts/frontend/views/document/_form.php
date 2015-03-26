<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use backend\models\DocumentPriority;
use backend\models\Employee;
use frontend\models\Customer;
use frontend\models\CompanyAgency;


/* @var $this yii\web\View */
/* @var $model frontend\models\Document */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="document-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'document_tracking_number')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'document_name')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'document_description')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'document_target_date')->textInput() ?>

    <?= $form->field($model, 'document_category')->textInput() ?>

    <?= $form->field($model, 'document_priority_id')->dropDownList(
        ArrayHelper::map(DocumentPriority::find()->all(),'id','document_priority_name'),
        ['prompt'=>'Select Document Priority']
    ) ?>

    <?= $form->field($model, 'document_type')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'document_comment')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'employee_id')->dropDownList(
        ArrayHelper::map(Employee::find()->all(),'id','last_name'),
        ['prompt'=>'Select Employee']
    ) ?>

    <?= $form->field($model, 'customer_id')->dropDownList(
        ArrayHelper::map(Customer::find()->all(),'id','customer_lastname'),
        ['prompt'=>'Select Customer']
    ) ?>

    <?= $form->field($model, 'company_agency_id')->textInput() ?>

    <?= $form->field($model, 'company_agency_id')->dropDownList(
        ArrayHelper::map(CompanyAgency::find()->all(),'id','company_agencyl_name'),
        ['prompt'=>'Select CompanyAgency']
    ) ?>

    <?= $form->field($model, 'document_image_front_page')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
