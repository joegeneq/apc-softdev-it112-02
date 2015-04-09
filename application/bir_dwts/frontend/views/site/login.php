<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

$this->title = 'Login';
//$this->params['breadcrumbs'][] = $this->title;
//   <p>Please fill out the following fields to login:</p>
?>
<div class="site-login">
    <?= Html::encode($this->title) ?>
</div>

<div class="site-login2">
    <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>
    <?= $form->field($model, 'username') ?>
    <?= $form->field($model, 'password')->passwordInput() ?>
    <?= $form->field($model, 'rememberMe')->checkbox() ?>
    <?= Html::submitButton('Login', ['class' => 'btn btn-primary', 'name' => 'login-button']) ?>
    <?php ActiveForm::end(); ?>
</div>
