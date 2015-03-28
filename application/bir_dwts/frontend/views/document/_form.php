<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\document */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="document-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'document_tracking_number')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'document_name')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'document_description')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'document_target_date')->textInput() ?>

    <?= $form->field($model, 'document_category')->textInput() ?>

    <?= $form->field($model, 'document_priority_id')->textInput() ?>

    <?= $form->field($model, 'document_type_id')->textInput() ?>

    <?= $form->field($model, 'document_comment')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'employee_id')->textInput() ?>

    <?= $form->field($model, 'customer_id')->textInput() ?>

    <?= $form->field($model, 'company_agency_id')->textInput() ?>

    <?= $form->field($model, 'document_image_front_page')->textInput() ?>

    <?= $form->field($model, 'create_time')->textInput() ?>

    <?= $form->field($model, 'update_time')->textInput() ?>

    <?= $form->field($model, 'section_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
