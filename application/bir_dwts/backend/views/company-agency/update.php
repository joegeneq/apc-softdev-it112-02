<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\CompanyAgency */

$this->title = 'Update Company Agency: ' . ' ' . $model->company_agency_code;
$this->params['breadcrumbs'][] = ['label' => 'Company Agencies', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->company_agency_code, 'url' => ['view', 'id' => $model->company_agency_code]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="company-agency-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
