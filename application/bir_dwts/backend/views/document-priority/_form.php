<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\DocumentPriority */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="document-priority-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'document_priority_name')->textInput(['maxlength' => 45]) ?>

    <?= $form->field($model, 'document_priority_description')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
