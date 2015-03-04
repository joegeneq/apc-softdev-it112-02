<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Company_agency */

$this->title = 'Create Company Agency';
$this->params['breadcrumbs'][] = ['label' => 'Company Agencies', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="company-agency-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
