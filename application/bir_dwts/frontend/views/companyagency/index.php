<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\bootstrap\Modal;
use yii\helpers\Url;;

/* @var $this yii\web\View */
/* @var $searchModel frontend\models\CompanyAgencySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Company Agencies';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="company-agency-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::button('Create Company Agency',  ['value'=>Url::to('index.php?r=companyagency%2Fcreate'), 'class' => 'btn btn-success', 'id'=>'modalButton']) ?>
    </p>

    <?php
        Modal::begin([
                'header'=>'<h4>Company Agency</h4>',
                'id' => 'modal',
                'size' => 'modal-lg',
            ]);

        echo "<div id='modalContent'></div>";

        Modal::end();
    ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id',
            'company_agency_code',
            'company_agencyl_name',
            'company_agency_description:ntext',
            'create_time',
            'update_time',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
