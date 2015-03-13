<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use backend\models\Customer;
use backend\models\Employee;

/* @var $this yii\web\View */
/* @var $model backend\models\document */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="document-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'create_time')->textInput() ?>

    <?= $form->field($model, 'update_time')->textInput() ?>

    <?= $form->field($model, 'encoded_by')->dropdownList(
        ArrayHelper::map(Employee::find()->all(),'id','name'),
        ['prompt'=>'Select ID'] 
) ?>

    <?= $form->field($model, 'customer_id')->dropdownList(
        ArrayHelper::map(Customer::find()->all(),'id','customer_name'),
        ['prompt'=>'Select ID'] 
) ?>

    <?= $form->field($model, 'company_agency_id')->textInput() ?>

    <?= $form->field($model, 'document_tracking_number')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'document_description')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'document_priority')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'document_category')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'document_type')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'document_notes')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'document_image_front_page')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
