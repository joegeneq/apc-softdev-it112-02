<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\DocumentSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="document-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'document_tracking_number') ?>

    <?= $form->field($model, 'document_name') ?>

    <?= $form->field($model, 'document_description') ?>

    <?= $form->field($model, 'document_target_date') ?>

    <?php $form->field($model, 'document_category') ?>

    <?php $form->field($model, 'document_priority_id') ?>

    <?php $form->field($model, 'document_type_id') ?>

    <?php $form->field($model, 'document_comment') ?>

    <?php $form->field($model, 'employee_id') ?>

    <?php $form->field($model, 'customer_id') ?>

    <?php $form->field($model, 'company_agency_id') ?>

    <?php $form->field($model, 'document_image_front_page') ?>

    <?php $form->field($model, 'create_time') ?>

    <?php $form->field($model, 'update_time') ?>

    <?php $form->field($model, 'section_id') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
